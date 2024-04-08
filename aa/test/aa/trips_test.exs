defmodule Aa.TripsTest do
  use Aa.DataCase

  alias Aa.Trips

  describe "trips" do
    alias Aa.Trips.Trip

    import Aa.TripsFixtures

    @invalid_attrs %{
      name: nil,
      private: nil,
      description: nil,
      destination: nil,
      start_date: nil,
      end_date: nil,
      created_by_user_id: nil
    }

    test "list_trips/0 returns all trips" do
      assert length(Trips.list_trips()) == 1
    end

    test "get_trip!/1 returns the trip with given id" do
      trip = trip_fixture()
      assert Trips.get_trip!(trip.id) == trip
    end

    test "create_trip/1 with valid data creates a trip" do
      valid_attrs = %{
        name: "some name",
        private: true,
        description: "some description",
        destination: "some destination",
        start_date: ~N[2024-04-07 18:04:00],
        end_date: ~N[2024-04-07 18:04:00],
        created_by_user_id: 1
      }

      assert {:ok, %Trip{} = trip} = Trips.create_trip(valid_attrs)
      assert trip.name == "some name"
      assert trip.private == true
      assert trip.description == "some description"
      assert trip.destination == "some destination"
      assert trip.start_date == ~N[2024-04-07 18:04:00]
      assert trip.end_date == ~N[2024-04-07 18:04:00]
      assert trip.created_by_user_id == 1
    end

    test "create_trip/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trips.create_trip(@invalid_attrs)
    end

    test "update_trip/2 with valid data updates the trip" do
      trip = trip_fixture()

      update_attrs = %{
        name: "some updated name",
        private: false,
        description: "some updated description",
        destination: "some updated destination",
        start_date: ~N[2024-04-08 18:04:00],
        end_date: ~N[2024-04-08 18:04:00],
        created_by_user_id: 1
      }

      assert {:ok, %Trip{} = trip} = Trips.update_trip(trip, update_attrs)
      assert trip.name == "some updated name"
      assert trip.private == false
      assert trip.description == "some updated description"
      assert trip.destination == "some updated destination"
      assert trip.start_date == ~N[2024-04-08 18:04:00]
      assert trip.end_date == ~N[2024-04-08 18:04:00]
      assert trip.created_by_user_id == 1
    end

    test "update_trip/2 with invalid data returns error changeset" do
      trip = trip_fixture()
      assert {:error, %Ecto.Changeset{}} = Trips.update_trip(trip, @invalid_attrs)
      assert trip == Trips.get_trip!(trip.id)
    end

    test "delete_trip/1 deletes the trip" do
      trip = trip_fixture()
      assert {:ok, %Trip{}} = Trips.delete_trip(trip)
      assert_raise Ecto.NoResultsError, fn -> Trips.get_trip!(trip.id) end
    end

    test "change_trip/1 returns a trip changeset" do
      trip = trip_fixture()
      assert %Ecto.Changeset{} = Trips.change_trip(trip)
    end
  end
end
