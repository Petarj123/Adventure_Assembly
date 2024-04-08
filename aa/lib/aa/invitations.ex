defmodule Aa.Invitations do
  @moduledoc """
  The Invitations context.
  """

  import Ecto.Query, warn: false
  alias Aa.Repo

  alias Aa.Invitations.Invitation
  alias Aa.TripParticipants
  alias Aa.UserTripRoles

  @doc """
  Returns the list of invitations.

  ## Examples

      iex> list_invitations()
      [%Invitation{}, ...]

  """
  def list_invitations do
    Repo.all(Invitation)
  end

  @doc """
  Gets a single invitation.

  Raises `Ecto.NoResultsError` if the Invitation does not exist.

  ## Examples

      iex> get_invitation!(123)
      %Invitation{}

      iex> get_invitation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_invitation!(id), do: Repo.get!(Invitation, id)

  @doc """
  Creates a invitation.

  ## Examples

      iex> create_invitation(%{field: value})
      {:ok, %Invitation{}}

      iex> create_invitation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_invitation(attrs \\ %{}) do
    %Invitation{}
    |> Invitation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a invitation.

  ## Examples

      iex> update_invitation(invitation, %{field: new_value})
      {:ok, %Invitation{}}

      iex> update_invitation(invitation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_invitation(%Invitation{} = invitation, attrs) do
    invitation
    |> Invitation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a invitation.

  ## Examples

      iex> delete_invitation(invitation)
      {:ok, %Invitation{}}

      iex> delete_invitation(invitation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_invitation(%Invitation{} = invitation) do
    Repo.delete(invitation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking invitation changes.

  ## Examples

      iex> change_invitation(invitation)
      %Ecto.Changeset{data: %Invitation{}}

  """
  def change_invitation(%Invitation{} = invitation, attrs \\ %{}) do
    Invitation.changeset(invitation, attrs)
  end

  def get_by_token(token), do: Repo.get_by(Invitation, invitation_token: token || "")

  def send_invitation(sender_id, recipient_id, trip_id) do
    if TripParticipants.exists?(sender_id, trip_id) do
      case TripParticipants.exists?(recipient_id, trip_id) do
        true ->
          {:error, "The user you are trying to invite is already a member of this trip"}

        false ->
          case create_invitation(%{
                 user_id: recipient_id,
                 trip_id: trip_id,
                 created_by_user_id: sender_id
               }) do
            {:ok, invitation} -> {:ok, invitation}
            error -> error
          end
      end
    else
      {:error, "Only trip participants can invite other users"}
    end
  end

  def validate_invitation_token(token) do
    case get_by_token(token) do
      nil ->
        {:error, :resource_not_found}

      %Invitation{status: "pending", valid_until: valid_until} = invitation ->
        current_time = NaiveDateTime.utc_now()

        if NaiveDateTime.compare(current_time, valid_until) == :gt do
          {:error, "Invitation Expired"}
        else
          {:ok, invitation}
        end

      %Invitation{status: _} ->
        {:error, "Invitation Already Processed"}
    end
  end

  def accept_invitation(user_id, token) do
    case validate_invitation_token(token) do
      {:ok, invitation} when invitation.user_id == user_id ->
        accept_invitation_process(invitation)

      {:ok, _invitation} ->
        {:error, "User ID mismatch."}

      error ->
        error
    end
  end

  def accept_invitation_process(invitation) do
    Ecto.Multi.new()
    |> Ecto.Multi.run(:create_trip_participant, fn _repo, _changes ->
      TripParticipants.create_trip_participant(%{
        user_id: invitation.user_id,
        trip_id: invitation.trip_id
      })
    end)
    |> Ecto.Multi.run(:create_user_trip_role, fn _repo, changes ->
      trip_participant = changes[:create_trip_participant]

      UserTripRoles.create_user_trip_role(%{
        user_id: trip_participant.user_id,
        trip_id: trip_participant.trip_id,
        trip_role_id: 3
      })
    end)
    |> Ecto.Multi.run(:update_invitation, fn _repo, _changes ->
      update_invitation(invitation, %{status: "accepted"})
    end)
    |> Repo.transaction()
    |> case do
      {:ok, _result} ->
        {:ok, invitation}

      {:error, _operation, reason, _changes} ->
        {:error, reason}
    end
  end

  def decline_invitation(user_id, token) do
    case validate_invitation_token(token) do
      {:ok, invitation} when invitation.user_id == user_id ->
        update_invitation(invitation, %{status: "declined"})

      error ->
        error
    end
  end
end
