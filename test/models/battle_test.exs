defmodule Champions.BattleTest do
  use Champions.ModelCase

  alias Champions.Battle

  @valid_attrs %{description: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Battle.changeset(%Battle{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Battle.changeset(%Battle{}, @invalid_attrs)
    refute changeset.valid?
  end
end
