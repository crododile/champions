defmodule Champions.ChampionControllerTest do
  use Champions.ConnCase

  alias Champions.Champion
  @valid_attrs %{agi: 42, cha: 42, int: 42, sta: 42, str: 42, wis: 42}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, champion_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing champions"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, champion_path(conn, :new)
    assert html_response(conn, 200) =~ "New champion"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, champion_path(conn, :create), champion: @valid_attrs
    assert redirected_to(conn) == champion_path(conn, :index)
    assert Repo.get_by(Champion, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, champion_path(conn, :create), champion: @invalid_attrs
    assert html_response(conn, 200) =~ "New champion"
  end

  test "shows chosen resource", %{conn: conn} do
    champion = Repo.insert! %Champion{}
    conn = get conn, champion_path(conn, :show, champion)
    assert html_response(conn, 200) =~ "Show champion"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, champion_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    champion = Repo.insert! %Champion{}
    conn = get conn, champion_path(conn, :edit, champion)
    assert html_response(conn, 200) =~ "Edit champion"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    champion = Repo.insert! %Champion{}
    conn = put conn, champion_path(conn, :update, champion), champion: @valid_attrs
    assert redirected_to(conn) == champion_path(conn, :show, champion)
    assert Repo.get_by(Champion, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    champion = Repo.insert! %Champion{}
    conn = put conn, champion_path(conn, :update, champion), champion: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit champion"
  end

  test "deletes chosen resource", %{conn: conn} do
    champion = Repo.insert! %Champion{}
    conn = delete conn, champion_path(conn, :delete, champion)
    assert redirected_to(conn) == champion_path(conn, :index)
    refute Repo.get(Champion, champion.id)
  end
end
