defmodule SkyskoolWeb.ClassView do
  use SkyskoolWeb, :view
  alias SkyskoolWeb.ClassView

  def render("index.json", %{class: class}) do
    %{data: render_many(class, ClassView, "class.json")}
  end

  def render("show.json", %{class: class}) do
    %{data: render_one(class, ClassView, "class.json")}
  end

  def render("class.json", %{class: class}) do
    %{id: class.id,
      grade: class.grade,
      section: class.section}
  end
end
