defmodule Aa.Invitations.Invitation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invitations" do
    field :status, :string, default: "pending"
    belongs_to :user, Aa.Accounts.User
    field :invitation_token, :string
    field :valid_until, :naive_datetime
    belongs_to :trip, Aa.Trips.Trip
    belongs_to :created_by_user, Aa.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(invitation, attrs) do
    invitation
    |> cast(attrs, [
      :user_id,
      :invitation_token,
      :status,
      :valid_until,
      :trip_id,
      :created_by_user_id
    ])
    |> validate_required([:user_id, :trip_id, :created_by_user_id])
    |> validate_inclusion(:status, ["pending", "accepted", "declined"])
    |> set_valid_until()
    |> generate_token()
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:created_by_user_id)
    |> foreign_key_constraint(:trip_id)
  end

  defp generate_token(changeset) do
    if changeset.valid?,
      do:
        put_change(changeset, :invitation_token, :crypto.strong_rand_bytes(64) |> Base.encode64()),
      else: changeset
  end

  defp set_valid_until(changeset) do
    if changeset.valid? do
      put_change(
        changeset,
        :valid_until,
        NaiveDateTime.add(NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second), 1, :day)
      )
    else
      changeset
    end
  end
end
