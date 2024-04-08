defmodule Aa.TripParticipantsTest do
  use Aa.DataCase

  alias Aa.TripParticipants

  describe "trip_participants" do
    alias Aa.TripParticipants.TripParticipant

    import Aa.TripParticipantsFixtures

    @invalid_attrs %{trip_id: nil, user_id: nil}

    test "list_trip_participants/0 returns all trip_participants" do
      trip_participant = trip_participant_fixture()
      assert TripParticipants.list_trip_participants() == [trip_participant]
    end

    test "get_trip_participant!/1 returns the trip_participant with given id" do
      trip_participant = trip_participant_fixture()
      assert TripParticipants.get_trip_participant!(trip_participant.id) == trip_participant
    end

    test "create_trip_participant/1 with valid data creates a trip_participant" do
      valid_attrs = %{trip_id: 42, user_id: 42}

      assert {:ok, %TripParticipant{} = trip_participant} = TripParticipants.create_trip_participant(valid_attrs)
      assert trip_participant.trip_id == 42
      assert trip_participant.user_id == 42
    end

    test "create_trip_participant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TripParticipants.create_trip_participant(@invalid_attrs)
    end

    test "update_trip_participant/2 with valid data updates the trip_participant" do
      trip_participant = trip_participant_fixture()
      update_attrs = %{trip_id: 43, user_id: 43}

      assert {:ok, %TripParticipant{} = trip_participant} = TripParticipants.update_trip_participant(trip_participant, update_attrs)
      assert trip_participant.trip_id == 43
      assert trip_participant.user_id == 43
    end

    test "update_trip_participant/2 with invalid data returns error changeset" do
      trip_participant = trip_participant_fixture()
      assert {:error, %Ecto.Changeset{}} = TripParticipants.update_trip_participant(trip_participant, @invalid_attrs)
      assert trip_participant == TripParticipants.get_trip_participant!(trip_participant.id)
    end

    test "delete_trip_participant/1 deletes the trip_participant" do
      trip_participant = trip_participant_fixture()
      assert {:ok, %TripParticipant{}} = TripParticipants.delete_trip_participant(trip_participant)
      assert_raise Ecto.NoResultsError, fn -> TripParticipants.get_trip_participant!(trip_participant.id) end
    end

    test "change_trip_participant/1 returns a trip_participant changeset" do
      trip_participant = trip_participant_fixture()
      assert %Ecto.Changeset{} = TripParticipants.change_trip_participant(trip_participant)
    end
  end
end
