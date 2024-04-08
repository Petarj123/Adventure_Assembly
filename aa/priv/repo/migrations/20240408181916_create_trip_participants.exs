defmodule Aa.Repo.Migrations.CreateTripParticipants do
  use Ecto.Migration

  def change do
    create table(:trip_participants) do
      add :trip_id, :integer
      add :user_id, :integer

      timestamps(type: :utc_datetime)
    end

    create_if_not_exists(unique_index(:trip_participants, [:trip_id, :user_id]))
  end
end
