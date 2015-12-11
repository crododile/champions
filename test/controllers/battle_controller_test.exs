defmodule Champions.BattleControllerTest do
  use Champions.ConnCase

  alias Champions.Battle
  @valid_attrs %{description: "some content", title: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, battle_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing battles"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, battle_path(conn, :new)
    assert html_response(conn, 200) =~ "New battle"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, battle_path(conn, :create), battle: @valid_attrs
    assert redirected_to(conn) == battle_path(conn, :index)
    assert Repo.get_by(Battle, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, battle_path(conn, :create), battle: @invalid_attrs
    assert html_response(conn, 200) =~ "New battle"
  end

  test "shows chosen resource", %{conn: conn} do
    battle = Repo.insert! %Battle{}
    conn = get conn, battle_path(conn, :show, battle)
    assert html_response(conn, 200) =~ "Show battle"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, battle_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    battle = Repo.insert! %Battle{}
    conn = get conn, battle_path(conn, :edit, battle)
    assert html_response(conn, 200) =~ "Edit battle"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    battle = Repo.insert! %Battle{}
    conn = put conn, battle_path(conn, :update, battle), battle: @valid_attrs
    assert redirected_to(conn) == battle_path(conn, :show, battle)
    assert Repo.get_by(Battle, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    battle = Repo.insert! %Battle{}
    conn = put conn, battle_path(conn, :update, battle), battle: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit battle"
  end

  test "deletes chosen resource", %{conn: conn} do
    battle = Repo.insert! %Battle{}
    conn = delete conn, battle_path(conn, :delete, battle)
    assert redirected_to(conn) == battle_path(conn, :index)
    refute Repo.get(Battle, battle.id)
  end
end
