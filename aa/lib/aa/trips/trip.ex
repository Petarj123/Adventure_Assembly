defmodule Aa.Trips.Trip do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trips" do
    field :name, :string
    field :private, :boolean, default: false
    field :description, :string
    field :destination, :string
    field :start_date, :naive_datetime
    field :end_date, :naive_datetime
    belongs_to :created_by_user, Aa.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(trip, attrs) do
    trip
    |> cast(attrs, [
      :name,
      :description,
      :destination,
      :private,
      :start_date,
      :end_date,
      :created_by_user_id
    ])
    |> validate_required([
      :name,
      :description,
      :destination,
      :private,
      :start_date,
      :end_date,
      :created_by_user_id
    ])
    |> foreign_key_constraint(:created_by_user_id)
  end
end
