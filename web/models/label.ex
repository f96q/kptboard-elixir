defmodule Kptboard.Label do
  use Kptboard.Web, :model

  schema "labels" do
    field :type, :string
    field :description, :string
    field :position, :integer

    belongs_to :retrospective, Kptboard.Retrospective
    belongs_to :user, Kptboard.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:type, :description, :position, :retrospective_id, :user_id])
    |> validate_required([:type, :description, :position, :retrospective_id])
  end
end
