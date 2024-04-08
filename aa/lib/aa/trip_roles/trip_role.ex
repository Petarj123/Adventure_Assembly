defmodule Aa.TripRoles.TripRole do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trip_roles" do
    field :name, :string
    field :color, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(trip_role, attrs) do
    trip_role
    |> cast(attrs, [:name, :color])
    |> validate_required([:name, :color])
  end
end
