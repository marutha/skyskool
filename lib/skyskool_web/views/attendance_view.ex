defmodule SkyskoolWeb.AttendanceView do
  use SkyskoolWeb, :view
  alias SkyskoolWeb.AttendanceView

  def render("index.json", %{attendance: attendance}) do
    %{data: render_many(attendance, AttendanceView, "attendance.json")}
  end

  def render("show.json", %{attendance: attendance}) do
    %{data: render_one(attendance, AttendanceView, "attendance.json")}
  end

  def render("attendance.json", %{attendance: attendance}) do
    %{id: attendance.id,
      attendance_date: attendance.attendance_date,
      attendance_type: attendance.attendance_type}
  end
end
