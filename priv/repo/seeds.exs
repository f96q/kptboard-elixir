# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Kptboard.Repo.insert!(%Kptboard.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Kptboard.Repo
alias Kptboard.Retrospective
alias Kptboard.Label
alias Kptboard.RetrospectivesUser
alias Kptboard.User

# labels = [
#   %{type: "keep", description: "description1"},
#   %{type: "keep", description: "description2"},
#   %{type: "keep", description: "description3"}
# ]

# Repo.transaction fn ->
#   user = %User{} |> User.changeset(%{name: "name"}) |> Repo.insert!
#   retrospective = %Retrospective{} |> Retrospective.changeset(%{title: "title"}) |> Repo.insert!
#   labels |> Enum.each(fn label -> retrospective |> Ecto.build_assoc(:labels) |> Label.changeset(label) |> Repo.insert! end)
#   retrospective |> Ecto.build_assoc(:retrospectives_users) |> RetrospectivesUser.changeset(%{user_id: user.id}) |> Repo.insert!
# end

#Repo.all(Retrospective) |> Repo.preload(:labels) |> IO.inspect

#Repo.all(Retrospective) |> IO.inspect

#retrospective = Repo.get(Retrospective, 35) |> Repo.preload(:labels) |> IO.inspect
#retrospective.labels |> IO.inspect

import Ecto.Query, only: [from: 2]

query = from r in Retrospective, where: r.id == 10

Repo.all(query) |> IO.inspect
