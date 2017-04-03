defmodule Kptboard.Retrospective do
  use Kptboard.Web, :model

  schema "retrospectives" do
    field :title, :string

    has_many :labels, Kptboard.Label, on_delete: :delete_all
    has_many :retrospectives_users, Kptboard.RetrospectivesUser, on_delete: :delete_all

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
