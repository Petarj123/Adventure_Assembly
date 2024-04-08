defmodule Aa.TripRolesTest do
  use Aa.DataCase

  alias Aa.TripRoles

  describe "trip_roles" do
    alias Aa.TripRoles.TripRole

    import Aa.TripRolesFixtures

    @invalid_attrs %{name: nil, color: nil}

    test "list_trip_roles/0 returns all trip_roles" do
      assert TripRoles.list_trip_roles() != []
    end

    test "get_trip_role!/1 returns the trip_role with given id" do
      trip_role = trip_role_fixture()
      assert TripRoles.get_trip_role!(trip_role.id) == trip_role
    end

    test "create_trip_role/1 with valid data creates a trip_role" do
      valid_attrs = %{name: "some name", color: "some color"}

      assert {:ok, %TripRole{} = trip_role} = TripRoles.create_trip_role(valid_attrs)
      assert trip_role.name == "some name"
      assert trip_role.color == "some color"
    end

    test "create_trip_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TripRoles.create_trip_role(@invalid_attrs)
    end

    test "update_trip_role/2 with valid data updates the trip_role" do
      trip_role = trip_role_fixture()
      update_attrs = %{name: "some updated name", color: "some updated color"}

      assert {:ok, %TripRole{} = trip_role} = TripRoles.update_trip_role(trip_role, update_attrs)
      assert trip_role.name == "some updated name"
      assert trip_role.color == "some updated color"
    end

    test "update_trip_role/2 with invalid data returns error changeset" do
      trip_role = trip_role_fixture()
      assert {:error, %Ecto.Changeset{}} = TripRoles.update_trip_role(trip_role, @invalid_attrs)
      assert trip_role == TripRoles.get_trip_role!(trip_role.id)
    end

    test "delete_trip_role/1 deletes the trip_role" do
      trip_role = trip_role_fixture()
      assert {:ok, %TripRole{}} = TripRoles.delete_trip_role(trip_role)
      assert_raise Ecto.NoResultsError, fn -> TripRoles.get_trip_role!(trip_role.id) end
    end

    test "change_trip_role/1 returns a trip_role changeset" do
      trip_role = trip_role_fixture()
      assert %Ecto.Changeset{} = TripRoles.change_trip_role(trip_role)
    end
  end
end
