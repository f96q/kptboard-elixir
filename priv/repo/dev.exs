alias Kptboard.{Repo, Retrospective, Label, RetrospectivesUser, User}

Repo.transaction fn ->
  user =
    %User{}
    |> User.changeset(%{name: "name"})
    |> Repo.insert!

  retrospective =
    %Retrospective{}
    |> Retrospective.changeset(%{title: "title"})
    |> Repo.insert!

  Enum.each([
    %{type: "keep", description: "description1", position: 1},
    %{type: "keep", description: "description2", position: 2},
    %{type: "keep", description: "description3", position: 3}
  ], fn label ->
    %Label{retrospective_id: retrospective.id}
    |> Label.changeset(label)
    |> Repo.insert!
  end)

  retrospective
  |> Ecto.build_assoc(:retrospectives_users)
  |> RetrospectivesUser.changeset(%{user_id: user.id})
  |> Repo.insert!
end
