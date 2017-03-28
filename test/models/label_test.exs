defmodule Kptboard.LabelTest do
  use Kptboard.ModelCase

  alias Kptboard.Label

  @valid_attrs %{description: "some content", position: 42, retrospective_id: 42, type: "some content", user_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Label.changeset(%Label{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Label.changeset(%Label{}, @invalid_attrs)
    refute changeset.valid?
  end
end
