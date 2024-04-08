defmodule Aa.Repo.Migrations.CreateTripRoles do
  use Ecto.Migration

  def up do
    create table(:trip_roles) do
      add :name, :string
      add :color, :string

      timestamps(type: :utc_datetime)
    end

    execute """
      insert into trip_roles(name, color, inserted_at, updated_at)
        values ('Owner', 'Red', now(), now()),
                ('Admin', 'Blue', now(), now()),
                ('Participant', 'Gry', now(), now())
    """
  end

  def down do
    drop table(:trip_roles)
  end
end
