defmodule Kptboard.Repo.Migrations.CreateRetrospective do
  use Ecto.Migration

  def change do
    create table(:retrospectives) do
      add :title, :string, null: false

      timestamps()
    end

  end
end
