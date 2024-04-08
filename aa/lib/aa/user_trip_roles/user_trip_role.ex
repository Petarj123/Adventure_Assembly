defmodule Aa.UserTripRoles.UserTripRole do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_trip_roles" do
    belongs_to(:user, Aa.Accounts.User)
    belongs_to(:trip, Aa.Trips.Trip)
    belongs_to(:trip_role, Aa.TripRoles.TripRole)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user_trip_role, attrs) do
    user_trip_role
    |> cast(attrs, [:user_id, :trip_id, :trip_role_id])
    |> validate_required([:user_id, :trip_id, :trip_role_id])
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:trip_id)
    |> foreign_key_constraint(:trip_role)
    |> unique_constraint([:user_id, :trip_id, :trip_role_id])
  end
end
