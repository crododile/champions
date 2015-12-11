defmodule Champions.BattleController do
  use Champions.Web, :controller

  alias Champions.Battle

  plug :scrub_params, "battle" when action in [:create, :update]

  def index(conn, _params) do
    battles = Repo.all(Battle)
    render(conn, "index.html", battles: battles)
  end

  def new(conn, _params) do
    changeset = Battle.changeset(%Battle{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"battle" => battle_params}) do
    changeset = Battle.changeset(%Battle{}, battle_params)

    case Repo.insert(changeset) do
      {:ok, _battle} ->
        conn
        |> put_flash(:info, "Battle created successfully.")
        |> redirect(to: battle_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    battle = Repo.get!(Battle, id)
    render(conn, "show.html", battle: battle)
  end

  def edit(conn, %{"id" => id}) do
    battle = Repo.get!(Battle, id)
    changeset = Battle.changeset(battle)
    render(conn, "edit.html", battle: battle, changeset: changeset)
  end

  def update(conn, %{"id" => id, "battle" => battle_params}) do
    battle = Repo.get!(Battle, id)
    changeset = Battle.changeset(battle, battle_params)

    case Repo.update(changeset) do
      {:ok, battle} ->
        conn
        |> put_flash(:info, "Battle updated successfully.")
        |> redirect(to: battle_path(conn, :show, battle))
      {:error, changeset} ->
        render(conn, "edit.html", battle: battle, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    battle = Repo.get!(Battle, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(battle)

    conn
    |> put_flash(:info, "Battle deleted successfully.")
    |> redirect(to: battle_path(conn, :index))
  end
end
