defmodule Kptboard.RetrospectiveTest do
  use Kptboard.ModelCase

  alias Kptboard.Retrospective

  @valid_attrs %{title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Retrospective.changeset(%Retrospective{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Retrospective.changeset(%Retrospective{}, @invalid_attrs)
    refute changeset.valid?
  end
end
