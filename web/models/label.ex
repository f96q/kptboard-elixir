defmodule Kptboard.Label do
  use Kptboard.Web, :model

  schema "labels" do
    field :type, :string
    field :description, :string
    field :position, :integer
    field :retrospective_id, :integer
    field :user_id, :integer

    has_one :retrospective, Kptboard.Retrospective
    has_one :user, Kptboard.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:type, :description, :position, :retrospective_id, :user_id])
    |> validate_required([:type, :description, :position, :retrospective_id, :user_id])
  end
end
