defmodule Kptboard.RetrospectivesUser do
  use Kptboard.Web, :model

  schema "retrospectives_users" do
    belongs_to :retrospective, Kptboard.Retrospective
    belongs_to :user, Kptboard.User

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
