defmodule Kptboard.RetrospectiveSerializer do
  use Kptboard.Web, :channel
  alias Kptboard.{LabelSerializer, UserSerializer}

  def serialize(retrospective) do
    keep_labels =
      retrospective
      |> labels("keep")

    problem_labels =
      retrospective
      |> labels("problem")

    try_labels =
      retrospective
      |> labels("try")

    users =
      assoc(retrospective, :users)
      |> Repo.all
      |> Enum.map(&(UserSerializer.serialize(&1)))

    %{
      id: retrospective.id,
      title: retrospective.title,
      users: users,
      labels: %{
        keep: keep_labels,
        problem: problem_labels,
        try: try_labels
      }
    }
  end

  defp labels(retrospective, type) do
    assoc(retrospective, :labels)
    |> where([l], l.type == ^type)
    |> Repo.all
    |> Enum.map(&(LabelSerializer.serialize(&1)))
  end
end
