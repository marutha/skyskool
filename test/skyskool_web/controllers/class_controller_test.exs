defmodule SkyskoolWeb.ClassControllerTest do
  use SkyskoolWeb.ConnCase

  alias Skyskool.Schools
  alias Skyskool.Schools.Class

  @create_attrs %{
    grade: "some grade",
    section: "some section"
  }
  @update_attrs %{
    grade: "some updated grade",
    section: "some updated section"
  }
  @invalid_attrs %{grade: nil, section: nil}

  def fixture(:class) do
    {:ok, class} = Schools.create_class(@create_attrs)
    class
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all class", %{conn: conn} do
      conn = get(conn, Routes.class_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create class" do
    test "renders class when data is valid", %{conn: conn} do
      conn = post(conn, Routes.class_path(conn, :create), class: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.class_path(conn, :show, id))

      assert %{
               "id" => id,
               "grade" => "some grade",
               "section" => "some section"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.class_path(conn, :create), class: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update class" do
    setup [:create_class]

    test "renders class when data is valid", %{conn: conn, class: %Class{id: id} = class} do
      conn = put(conn, Routes.class_path(conn, :update, class), class: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.class_path(conn, :show, id))

      assert %{
               "id" => id,
               "grade" => "some updated grade",
               "section" => "some updated section"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, class: class} do
      conn = put(conn, Routes.class_path(conn, :update, class), class: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete class" do
    setup [:create_class]

    test "deletes chosen class", %{conn: conn, class: class} do
      conn = delete(conn, Routes.class_path(conn, :delete, class))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.class_path(conn, :show, class))
      end
    end
  end

  defp create_class(_) do
    class = fixture(:class)
    %{class: class}
  end
end
