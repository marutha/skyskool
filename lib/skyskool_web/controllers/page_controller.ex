defmodule SkyskoolWeb.PageController do
  use SkyskoolWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
