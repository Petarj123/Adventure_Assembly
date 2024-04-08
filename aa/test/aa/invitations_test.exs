defmodule Aa.InvitationsTest do
  use Aa.DataCase

  alias Aa.Invitations

  describe "invitations" do
    alias Aa.Invitations.Invitation

    import Aa.InvitationsFixtures

    @invalid_attrs %{
      status: nil,
      user_id: nil,
      invitation_token: nil,
      valid_until: nil,
      trip_id: nil,
      created_by_user_id: nil
    }

    test "list_invitations/0 returns all invitations" do
      invitation = invitation_fixture()
      assert Invitations.list_invitations() == [invitation]
    end

    test "get_invitation!/1 returns the invitation with given id" do
      invitation = invitation_fixture()
      assert Invitations.get_invitation!(invitation.id) == invitation
    end

    test "create_invitation/1 with valid data creates a invitation" do
      valid_attrs = %{
        status: "pending",
        user_id: 1,
        invitation_token: "some invitation_token",
        valid_until: ~N[2024-04-07 19:28:00],
        trip_id: 1,
        created_by_user_id: 1
      }

      assert {:ok, %Invitation{} = invitation} = Invitations.create_invitation(valid_attrs)
      assert invitation.status == "pending"
      assert invitation.user_id == 1
      assert invitation.trip_id == 1
      assert invitation.created_by_user_id == 1
    end

    test "create_invitation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Invitations.create_invitation(@invalid_attrs)
    end

    test "update_invitation/2 with valid data updates the invitation" do
      invitation = invitation_fixture()

      update_attrs = %{
        status: "accepted",
        user_id: 1,
        invitation_token: "some updated invitation_token",
        valid_until: ~N[2024-04-08 19:28:00],
        trip_id: 1,
        created_by_user_id: 1
      }

      assert {:ok, %Invitation{} = invitation} =
               Invitations.update_invitation(invitation, update_attrs)

      assert invitation.status == "accepted"
      assert invitation.user_id == 1
      assert invitation.trip_id == 1
      assert invitation.created_by_user_id == 1
    end

    test "update_invitation/2 with invalid data returns error changeset" do
      invitation = invitation_fixture()

      assert {:error, _} =
               Invitations.update_invitation(invitation, @invalid_attrs)

      assert invitation == Invitations.get_invitation!(invitation.id)
    end

    test "delete_invitation/1 deletes the invitation" do
      invitation = invitation_fixture()
      assert {:ok, %Invitation{}} = Invitations.delete_invitation(invitation)
      assert_raise Ecto.NoResultsError, fn -> Invitations.get_invitation!(invitation.id) end
    end

    test "change_invitation/1 returns a invitation changeset" do
      invitation = invitation_fixture()
      assert %Ecto.Changeset{} = Invitations.change_invitation(invitation)
    end
  end
end
