defmodule Aa.UserTripRolesTest do
  use Aa.DataCase

  alias Aa.UserTripRoles

  describe "user_trip_roles" do
    alias Aa.UserTripRoles.UserTripRole

    import Aa.UserTripRolesFixtures

    @invalid_attrs %{user_id: nil, trip_id: nil, trip_role_id: nil}

    test "list_user_trip_roles/0 returns all user_trip_roles" do
      assert length(UserTripRoles.list_user_trip_roles()) == 1
    end

    test "get_user_trip_role!/1 returns the user_trip_role with given id" do
      user_trip_role = user_trip_role_fixture()
      assert UserTripRoles.get_user_trip_role!(user_trip_role.id) == user_trip_role
    end

    test "create_user_trip_role/1 with valid data creates a user_trip_role" do
      valid_attrs = %{user_id: 1, trip_id: 1, trip_role_id: 1}

      assert {:ok, %UserTripRole{} = user_trip_role} =
               UserTripRoles.create_user_trip_role(valid_attrs)

      assert user_trip_role.user_id == 1
      assert user_trip_role.trip_id == 1
      assert user_trip_role.trip_role_id == 1
    end

    test "create_user_trip_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = UserTripRoles.create_user_trip_role(@invalid_attrs)
    end

    test "update_user_trip_role/2 with valid data updates the user_trip_role" do
      user_trip_role = user_trip_role_fixture()
      update_attrs = %{user_id: 1, trip_id: 1, trip_role_id: 1}

      assert {:ok, %UserTripRole{} = user_trip_role} =
               UserTripRoles.update_user_trip_role(user_trip_role, update_attrs)

      assert user_trip_role.user_id == 1
      assert user_trip_role.trip_id == 1
      assert user_trip_role.trip_role_id == 1
    end

    test "update_user_trip_role/2 with invalid data returns error changeset" do
      user_trip_role = user_trip_role_fixture()

      assert {:error, %Ecto.Changeset{}} =
               UserTripRoles.update_user_trip_role(user_trip_role, @invalid_attrs)

      assert user_trip_role == UserTripRoles.get_user_trip_role!(user_trip_role.id)
    end

    test "delete_user_trip_role/1 deletes the user_trip_role" do
      user_trip_role = user_trip_role_fixture()
      assert {:ok, %UserTripRole{}} = UserTripRoles.delete_user_trip_role(user_trip_role)

      assert_raise Ecto.NoResultsError, fn ->
        UserTripRoles.get_user_trip_role!(user_trip_role.id)
      end
    end

    test "change_user_trip_role/1 returns a user_trip_role changeset" do
      user_trip_role = user_trip_role_fixture()
      assert %Ecto.Changeset{} = UserTripRoles.change_user_trip_role(user_trip_role)
    end
  end
end
