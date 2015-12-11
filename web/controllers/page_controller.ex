defmodule Champions.PageController do
  use Champions.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
