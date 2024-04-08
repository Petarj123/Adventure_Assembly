defmodule Aa.TripParticipantsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Aa.TripParticipants` context.
  """

  @doc """
  Generate a trip_participant.
  """
  def trip_participant_fixture(attrs \\ %{}) do
    {:ok, trip_participant} =
      attrs
      |> Enum.into(%{
        trip_id: 42,
        user_id: 42
      })
      |> Aa.TripParticipants.create_trip_participant()

    trip_participant
  end
end
