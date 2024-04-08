defmodule Aa.InvitationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Aa.Invitations` context.
  """

  @doc """
  Generate a invitation.
  """
  def invitation_fixture(attrs \\ %{}) do
    {:ok, invitation} =
      attrs
      |> Enum.into(%{
        created_by_user_id: 1,
        invitation_token: "some invitation_token",
        status: "pending",
        trip_id: 1,
        user_id: 1,
        valid_until: ~N[2024-04-07 19:28:00]
      })
      |> Aa.Invitations.create_invitation()

    invitation
  end
end
