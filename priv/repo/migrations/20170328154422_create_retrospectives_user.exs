defmodule Kptboard.Repo.Migrations.CreateRetrospectivesUser do
  use Ecto.Migration

  def change do
    create table(:retrospectives_users) do
      add :retrospective_id, references(:retrospectives, on_delete: :delete_all), null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:retrospectives_users, [:retrospective_id])
    create index(:retrospectives_users, [:user_id])
    create index(:retrospectives_users, [:retrospective_id, :user_id], unique: true)
  end
end
