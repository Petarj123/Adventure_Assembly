defmodule Aa.TripRolesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Aa.TripRoles` context.
  """

  @doc """
  Generate a trip_role.
  """
  def trip_role_fixture(attrs \\ %{}) do
    {:ok, trip_role} =
      attrs
      |> Enum.into(%{
        color: "some color",
        name: "some name"
      })
      |> Aa.TripRoles.create_trip_role()

    trip_role
  end
end
