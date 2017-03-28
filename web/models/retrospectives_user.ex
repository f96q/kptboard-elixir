defmodule Kptboard.RetrospectivesUser do
  use Kptboard.Web, :model

  schema "retrospectives_users" do
    field :retrospective_id, :integer
    field :user_id, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:retrospective_id, :user_id])
    |> validate_required([:retrospective_id, :user_id])
  end
end
