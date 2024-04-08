defmodule Aa.Repo.Migrations.CreateUserTripRoles do
  use Ecto.Migration

  def change do
    create table(:user_trip_roles) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :trip_id, references(:trips, on_delete: :delete_all)
      add :trip_role_id, references(:trip_roles, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create_if_not_exists(unique_index(:user_trip_roles, [:user_id, :trip_id, :trip_role_id]))
  end
end
