defmodule Aa.UserTripRoles do
  @moduledoc """
  The UserTripRoles context.
  """

  import Ecto.Query, warn: false
  alias Aa.Repo

  alias Aa.UserTripRoles.UserTripRole

  @doc """
  Returns the list of user_trip_roles.

  ## Examples

      iex> list_user_trip_roles()
      [%UserTripRole{}, ...]

  """
  def list_user_trip_roles do
    Repo.all(UserTripRole)
  end

  @doc """
  Gets a single user_trip_role.

  Raises `Ecto.NoResultsError` if the User trip role does not exist.

  ## Examples

      iex> get_user_trip_role!(123)
      %UserTripRole{}

      iex> get_user_trip_role!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_trip_role!(id), do: Repo.get!(UserTripRole, id)

  @doc """
  Creates a user_trip_role.

  ## Examples

      iex> create_user_trip_role(%{field: value})
      {:ok, %UserTripRole{}}

      iex> create_user_trip_role(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_trip_role(attrs \\ %{}) do
    %UserTripRole{}
    |> UserTripRole.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_trip_role.

  ## Examples

      iex> update_user_trip_role(user_trip_role, %{field: new_value})
      {:ok, %UserTripRole{}}

      iex> update_user_trip_role(user_trip_role, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_trip_role(%UserTripRole{} = user_trip_role, attrs) do
    user_trip_role
    |> UserTripRole.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_trip_role.

  ## Examples

      iex> delete_user_trip_role(user_trip_role)
      {:ok, %UserTripRole{}}

      iex> delete_user_trip_role(user_trip_role)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_trip_role(%UserTripRole{} = user_trip_role) do
    Repo.delete(user_trip_role)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_trip_role changes.

  ## Examples

      iex> change_user_trip_role(user_trip_role)
      %Ecto.Changeset{data: %UserTripRole{}}

  """
  def change_user_trip_role(%UserTripRole{} = user_trip_role, attrs \\ %{}) do
    UserTripRole.changeset(user_trip_role, attrs)
  end
end
