defmodule Aa.TripParticipants.TripParticipant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trip_participants" do
    belongs_to :trip, Aa.Trips.Trip
    belongs_to :user, Aa.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(trip_participant, attrs) do
    trip_participant
    |> cast(attrs, [:trip_id, :user_id])
    |> validate_required([:trip_id, :user_id])
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:trip_id)
    |> unique_constraint([:user_id, :trip_id])
  end
end
