defmodule SkyskoolWeb.AttendanceController do
  use SkyskoolWeb, :controller

  alias Skyskool.Schools
  alias Skyskool.Schools.Attendance

  action_fallback SkyskoolWeb.FallbackController

  def index(conn, _params) do
    attendance = Schools.list_attendance()
    render(conn, "index.json", attendance: attendance)
  end

  def create(conn, %{"attendance" => attendance_params}) do
    with {:ok, %Attendance{} = attendance} <- Schools.create_attendance(attendance_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.attendance_path(conn, :show, attendance))
      |> render("show.json", attendance: attendance)
    end
  end

  def show(conn, %{"id" => id}) do
    attendance = Schools.get_attendance!(id)
    render(conn, "show.json", attendance: attendance)
  end

  def update(conn, %{"id" => id, "attendance" => attendance_params}) do
    attendance = Schools.get_attendance!(id)

    with {:ok, %Attendance{} = attendance} <- Schools.update_attendance(attendance, attendance_params) do
      render(conn, "show.json", attendance: attendance)
    end
  end

  def delete(conn, %{"id" => id}) do
    attendance = Schools.get_attendance!(id)

    with {:ok, %Attendance{}} <- Schools.delete_attendance(attendance) do
      send_resp(conn, :no_content, "")
    end
  end
end
