defmodule Aa.TripRoles do
  @moduledoc """
  The TripRoles context.
  """

  import Ecto.Query, warn: false
  alias Aa.Repo

  alias Aa.TripRoles.TripRole

  @doc """
  Returns the list of trip_roles.

  ## Examples

      iex> list_trip_roles()
      [%TripRole{}, ...]

  """
  def list_trip_roles do
    Repo.all(TripRole)
  end

  @doc """
  Gets a single trip_role.

  Raises `Ecto.NoResultsError` if the Trip role does not exist.

  ## Examples

      iex> get_trip_role!(123)
      %TripRole{}

      iex> get_trip_role!(456)
      ** (Ecto.NoResultsError)

  """
  def get_trip_role!(id), do: Repo.get!(TripRole, id)

  @doc """
  Creates a trip_role.

  ## Examples

      iex> create_trip_role(%{field: value})
      {:ok, %TripRole{}}

      iex> create_trip_role(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_trip_role(attrs \\ %{}) do
    %TripRole{}
    |> TripRole.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a trip_role.

  ## Examples

      iex> update_trip_role(trip_role, %{field: new_value})
      {:ok, %TripRole{}}

      iex> update_trip_role(trip_role, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_trip_role(%TripRole{} = trip_role, attrs) do
    trip_role
    |> TripRole.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a trip_role.

  ## Examples

      iex> delete_trip_role(trip_role)
      {:ok, %TripRole{}}

      iex> delete_trip_role(trip_role)
      {:error, %Ecto.Changeset{}}

  """
  def delete_trip_role(%TripRole{} = trip_role) do
    Repo.delete(trip_role)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking trip_role changes.

  ## Examples

      iex> change_trip_role(trip_role)
      %Ecto.Changeset{data: %TripRole{}}

  """
  def change_trip_role(%TripRole{} = trip_role, attrs \\ %{}) do
    TripRole.changeset(trip_role, attrs)
  end
end
