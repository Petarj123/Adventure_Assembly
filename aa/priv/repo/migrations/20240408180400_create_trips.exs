defmodule Aa.Repo.Migrations.CreateTrips do
  use Ecto.Migration

  def change do
    create table(:trips) do
      add :name, :string
      add :description, :string
      add :destination, :string
      add :private, :boolean, default: false, null: false
      add :start_date, :naive_datetime
      add :end_date, :naive_datetime
      add :created_by_user_id, references(:users)

      timestamps(type: :utc_datetime)
    end
  end
end
