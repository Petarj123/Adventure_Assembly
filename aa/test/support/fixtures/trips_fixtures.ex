defmodule Aa.TripsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Aa.Trips` context.
  """

  @doc """
  Generate a trip.
  """
  def trip_fixture(attrs \\ %{}) do
    {:ok, trip} =
      attrs
      |> Enum.into(%{
        created_by_user_id: 1,
        description: "some description",
        destination: "some destination",
        end_date: ~N[2024-04-07 18:04:00],
        name: "some name",
        private: true,
        start_date: ~N[2024-04-07 18:04:00]
      })
      |> Aa.Trips.create_trip()

    trip
  end
end
