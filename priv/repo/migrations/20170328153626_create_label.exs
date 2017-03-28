defmodule Kptboard.Repo.Migrations.CreateLabel do
  use Ecto.Migration

  def change do
    create table(:labels) do
      add :type, :string
      add :description, :text
      add :position, :integer
      add :retrospective_id, references(:retrospectives, on_delete: :delete_all), null: false
      add :user_id, references(:users, on_delete: :nilify_all)

      timestamps()
    end

    create index(:labels, [:retrospective_id])
    create index(:labels, [:user_id])
  end
end
