defmodule Champions.ChampionTest do
  use Champions.ModelCase

  alias Champions.Champion

  @valid_attrs %{agi: 42, cha: 42, int: 42, sta: 42, str: 42, wis: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Champion.changeset(%Champion{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Champion.changeset(%Champion{}, @invalid_attrs)
    refute changeset.valid?
  end
end
