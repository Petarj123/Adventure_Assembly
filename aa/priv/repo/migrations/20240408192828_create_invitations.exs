defmodule Aa.Repo.Migrations.CreateInvitations do
  use Ecto.Migration

  def change do
    create table(:invitations) do
      add :status, :string
      add :user_id, references(:users)
      add :invitation_token, :string
      add :valid_until, :naive_datetime
      add :trip_id, references(:trips)
      add :created_by_user_id, references(:users)

      timestamps(type: :utc_datetime)
    end
  end
end
