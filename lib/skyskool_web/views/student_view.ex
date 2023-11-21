defmodule SkyskoolWeb.StudentView do
  use SkyskoolWeb, :view
  alias SkyskoolWeb.StudentView

  def render("index.json", %{students: students}) do
    %{data: render_many(students, StudentView, "student.json")}
  end

  def render("show.json", %{student: student}) do
    %{data: render_one(student, StudentView, "student.json")}
  end

  def render("student.json", %{student: student}) do
    %{id: student.id,
      class_id: student.class_id,
      name: student.name,
      dob: student.dob,
      email: student.email}
  end
end
