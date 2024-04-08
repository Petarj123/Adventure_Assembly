defmodule Aa.Trips do
  @moduledoc """
  The Trips context.
  """

  import Ecto.Query, warn: false
  alias Aa.Repo

  alias Aa.Trips.Trip
  alias Aa.TripParticipants
  alias Aa.UserTripRoles

  @doc """
  Returns the list of trips.

  ## Examples

      iex> list_trips()
      [%Trip{}, ...]

  """
  def list_trips do
    Repo.all(Trip)
  end

  @doc """
  Gets a single trip.

  Raises `Ecto.NoResultsError` if the Trip does not exist.

  ## Examples

      iex> get_trip!(123)
      %Trip{}

      iex> get_trip!(456)
      ** (Ecto.NoResultsError)

  """
  def get_trip!(id), do: Repo.get!(Trip, id)

  @doc """
  Creates a trip.

  ## Examples

      iex> create_trip(%{field: value})
      {:ok, %Trip{}}

      iex> create_trip(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_trip(attrs \\ %{}) do
    multi =
      Ecto.Multi.new()
      |> Ecto.Multi.insert(:trip, Trip.changeset(%Trip{}, attrs))
      |> Ecto.Multi.run(:trip_participant, fn _repo, %{trip: trip} ->
        TripParticipants.create_trip_participant(%{
          user_id: trip.created_by_user_id,
          trip_id: trip.id
        })
      end)
      |> Ecto.Multi.run(:user_trip_role, fn _repo, %{trip: trip} ->
        UserTripRoles.create_user_trip_role(%{
          user_id: trip.created_by_user_id,
          trip_id: trip.id,
          trip_role_id: 1
        })
      end)

    case Repo.transaction(multi) do
      {:ok, %{trip: trip}} ->
        {:ok, trip}

      {:error, _, changeset, _} ->
        {:error, changeset}
    end
  end

  @doc """
  Updates a trip.

  ## Examples

      iex> update_trip(trip, %{field: new_value})
      {:ok, %Trip{}}

      iex> update_trip(trip, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_trip(%Trip{} = trip, attrs) do
    trip
    |> Trip.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a trip.

  ## Examples

      iex> delete_trip(trip)
      {:ok, %Trip{}}

      iex> delete_trip(trip)
      {:error, %Ecto.Changeset{}}

  """
  def delete_trip(%Trip{} = trip) do
    Repo.delete(trip)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking trip changes.

  ## Examples

      iex> change_trip(trip)
      %Ecto.Changeset{data: %Trip{}}

  """
  def change_trip(%Trip{} = trip, attrs \\ %{}) do
    Trip.changeset(trip, attrs)
  end
end
