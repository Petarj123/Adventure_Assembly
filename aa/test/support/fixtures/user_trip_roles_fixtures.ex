defmodule Aa.UserTripRolesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Aa.UserTripRoles` context.
  """

  @doc """
  Generate a user_trip_role.
  """
  def user_trip_role_fixture(attrs \\ %{}) do
    {:ok, user_trip_role} =
      attrs
      |> Enum.into(%{
        trip_id: 1,
        trip_role_id: 1,
        user_id: 1
      })
      |> Aa.UserTripRoles.create_user_trip_role()

    user_trip_role
  end
end
