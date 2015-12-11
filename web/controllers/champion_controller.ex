defmodule Champions.ChampionController do
  use Champions.Web, :controller

  alias Champions.Champion

  plug :scrub_params, "champion" when action in [:create, :update]

  def index(conn, _params) do
    champions = Repo.all(Champion)
    render(conn, "index.html", champions: champions)
  end

  def new(conn, _params) do
    changeset = Champion.changeset(%Champion{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"champion" => champion_params}) do
    changeset = Champion.changeset(%Champion{}, champion_params)

    case Repo.insert(changeset) do
      {:ok, _champion} ->
        conn
        |> put_flash(:info, "Champion created successfully.")
        |> redirect(to: champion_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    champion = Repo.get!(Champion, id)
    render(conn, "show.html", champion: champion)
  end

  def edit(conn, %{"id" => id}) do
    champion = Repo.get!(Champion, id)
    changeset = Champion.changeset(champion)
    render(conn, "edit.html", champion: champion, changeset: changeset)
  end

  def update(conn, %{"id" => id, "champion" => champion_params}) do
    champion = Repo.get!(Champion, id)
    changeset = Champion.changeset(champion, champion_params)

    case Repo.update(changeset) do
      {:ok, champion} ->
        conn
        |> put_flash(:info, "Champion updated successfully.")
        |> redirect(to: champion_path(conn, :show, champion))
      {:error, changeset} ->
        render(conn, "edit.html", champion: champion, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    champion = Repo.get!(Champion, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(champion)

    conn
    |> put_flash(:info, "Champion deleted successfully.")
    |> redirect(to: champion_path(conn, :index))
  end
end
