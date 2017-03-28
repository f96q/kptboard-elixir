defmodule Kptboard.RetrospectivesUserTest do
  use Kptboard.ModelCase

  alias Kptboard.RetrospectivesUser

  @valid_attrs %{retrospective_id: 42, user_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = RetrospectivesUser.changeset(%RetrospectivesUser{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = RetrospectivesUser.changeset(%RetrospectivesUser{}, @invalid_attrs)
    refute changeset.valid?
  end
end
