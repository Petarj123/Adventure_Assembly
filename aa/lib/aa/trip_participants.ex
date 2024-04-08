defmodule Aa.TripParticipants do
  @moduledoc """
  The TripParticipants context.
  """

  import Ecto.Query, warn: false
  alias Aa.Repo

  alias Aa.TripParticipants.TripParticipant

  @doc """
  Returns the list of trip_participants.

  ## Examples

      iex> list_trip_participants()
      [%TripParticipant{}, ...]

  """
  def list_trip_participants do
    Repo.all(TripParticipant)
  end

  @doc """
  Gets a single trip_participant.

  Raises `Ecto.NoResultsError` if the Trip participant does not exist.

  ## Examples

      iex> get_trip_participant!(123)
      %TripParticipant{}

      iex> get_trip_participant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_trip_participant!(id), do: Repo.get!(TripParticipant, id)

  @doc """
  Creates a trip_participant.

  ## Examples

      iex> create_trip_participant(%{field: value})
      {:ok, %TripParticipant{}}

      iex> create_trip_participant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_trip_participant(attrs \\ %{}) do
    %TripParticipant{}
    |> TripParticipant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a trip_participant.

  ## Examples

      iex> update_trip_participant(trip_participant, %{field: new_value})
      {:ok, %TripParticipant{}}

      iex> update_trip_participant(trip_participant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_trip_participant(%TripParticipant{} = trip_participant, attrs) do
    trip_participant
    |> TripParticipant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a trip_participant.

  ## Examples

      iex> delete_trip_participant(trip_participant)
      {:ok, %TripParticipant{}}

      iex> delete_trip_participant(trip_participant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_trip_participant(%TripParticipant{} = trip_participant) do
    Repo.delete(trip_participant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking trip_participant changes.

  ## Examples

      iex> change_trip_participant(trip_participant)
      %Ecto.Changeset{data: %TripParticipant{}}

  """
  def change_trip_participant(%TripParticipant{} = trip_participant, attrs \\ %{}) do
    TripParticipant.changeset(trip_participant, attrs)
  end
end
