defmodule Aa.Repo.Migrations.CreateTripParticipants do
  use Ecto.Migration

  def change do
    create table(:trip_participants) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :trip_id, references(:trips, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create_if_not_exists(unique_index(:trip_participants, [:trip_id, :user_id]))
  end
end
