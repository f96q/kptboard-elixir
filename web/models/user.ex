defmodule Kptboard.User do
  use Kptboard.Web, :model

  schema "users" do
    field :name, :string

    has_many :retrospectives_users, Kptboard.RetrospectivesUser, on_delete: :delete_all
    has_many :retrospectives, through: [:retrospectives_users, :retrospective]

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
