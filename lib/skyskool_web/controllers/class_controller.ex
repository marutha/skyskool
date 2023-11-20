defmodule SkyskoolWeb.ClassController do
  use SkyskoolWeb, :controller

  alias Skyskool.Schools
  alias Skyskool.Schools.Class

  action_fallback SkyskoolWeb.FallbackController

  def index(conn, _params) do
    class = Schools.list_class()
    render(conn, "index.json", class: class)
  end

  def create(conn, %{"class" => class_params}) do
    with {:ok, %Class{} = class} <- Schools.create_class(class_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.class_path(conn, :show, class))
      |> render("show.json", class: class)
    end
  end

  def show(conn, %{"id" => id}) do
    class = Schools.get_class!(id)
    render(conn, "show.json", class: class)
  end

  def update(conn, %{"id" => id, "class" => class_params}) do
    class = Schools.get_class!(id)

    with {:ok, %Class{} = class} <- Schools.update_class(class, class_params) do
      render(conn, "show.json", class: class)
    end
  end

  def delete(conn, %{"id" => id}) do
    class = Schools.get_class!(id)

    with {:ok, %Class{}} <- Schools.delete_class(class) do
      send_resp(conn, :no_content, "")
    end
  end
end
