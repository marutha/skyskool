defmodule Skyskool.SchoolsTest do
  use Skyskool.DataCase

  alias Skyskool.Schools

  describe "schools" do
    alias Skyskool.Schools.School

    @valid_attrs %{email: "some email", name: "some name"}
    @update_attrs %{email: "some updated email", name: "some updated name"}
    @invalid_attrs %{email: nil, name: nil}

    def school_fixture(attrs \\ %{}) do
      {:ok, school} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schools.create_school()

      school
    end

    test "list_schools/0 returns all schools" do
      school = school_fixture()
      assert Schools.list_schools() == [school]
    end

    test "get_school!/1 returns the school with given id" do
      school = school_fixture()
      assert Schools.get_school!(school.id) == school
    end

    test "create_school/1 with valid data creates a school" do
      assert {:ok, %School{} = school} = Schools.create_school(@valid_attrs)
      assert school.email == "some email"
      assert school.name == "some name"
    end

    test "create_school/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schools.create_school(@invalid_attrs)
    end

    test "update_school/2 with valid data updates the school" do
      school = school_fixture()
      assert {:ok, %School{} = school} = Schools.update_school(school, @update_attrs)
      assert school.email == "some updated email"
      assert school.name == "some updated name"
    end

    test "update_school/2 with invalid data returns error changeset" do
      school = school_fixture()
      assert {:error, %Ecto.Changeset{}} = Schools.update_school(school, @invalid_attrs)
      assert school == Schools.get_school!(school.id)
    end

    test "delete_school/1 deletes the school" do
      school = school_fixture()
      assert {:ok, %School{}} = Schools.delete_school(school)
      assert_raise Ecto.NoResultsError, fn -> Schools.get_school!(school.id) end
    end

    test "change_school/1 returns a school changeset" do
      school = school_fixture()
      assert %Ecto.Changeset{} = Schools.change_school(school)
    end
  end

  describe "class" do
    alias Skyskool.Schools.Class

    @valid_attrs %{grade: "some grade", section: "some section"}
    @update_attrs %{grade: "some updated grade", section: "some updated section"}
    @invalid_attrs %{grade: nil, section: nil}

    def class_fixture(attrs \\ %{}) do
      {:ok, class} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schools.create_class()

      class
    end

    test "list_class/0 returns all class" do
      class = class_fixture()
      assert Schools.list_class() == [class]
    end

    test "get_class!/1 returns the class with given id" do
      class = class_fixture()
      assert Schools.get_class!(class.id) == class
    end

    test "create_class/1 with valid data creates a class" do
      assert {:ok, %Class{} = class} = Schools.create_class(@valid_attrs)
      assert class.grade == "some grade"
      assert class.section == "some section"
    end

    test "create_class/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schools.create_class(@invalid_attrs)
    end

    test "update_class/2 with valid data updates the class" do
      class = class_fixture()
      assert {:ok, %Class{} = class} = Schools.update_class(class, @update_attrs)
      assert class.grade == "some updated grade"
      assert class.section == "some updated section"
    end

    test "update_class/2 with invalid data returns error changeset" do
      class = class_fixture()
      assert {:error, %Ecto.Changeset{}} = Schools.update_class(class, @invalid_attrs)
      assert class == Schools.get_class!(class.id)
    end

    test "delete_class/1 deletes the class" do
      class = class_fixture()
      assert {:ok, %Class{}} = Schools.delete_class(class)
      assert_raise Ecto.NoResultsError, fn -> Schools.get_class!(class.id) end
    end

    test "change_class/1 returns a class changeset" do
      class = class_fixture()
      assert %Ecto.Changeset{} = Schools.change_class(class)
    end
  end

  describe "students" do
    alias Skyskool.Schools.Student

    @valid_attrs %{dob: ~D[2010-04-17], email: "some email", name: "some name"}
    @update_attrs %{dob: ~D[2011-05-18], email: "some updated email", name: "some updated name"}
    @invalid_attrs %{dob: nil, email: nil, name: nil}

    def student_fixture(attrs \\ %{}) do
      {:ok, student} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schools.create_student()

      student
    end

    test "list_students/0 returns all students" do
      student = student_fixture()
      assert Schools.list_students() == [student]
    end

    test "get_student!/1 returns the student with given id" do
      student = student_fixture()
      assert Schools.get_student!(student.id) == student
    end

    test "create_student/1 with valid data creates a student" do
      assert {:ok, %Student{} = student} = Schools.create_student(@valid_attrs)
      assert student.dob == ~D[2010-04-17]
      assert student.email == "some email"
      assert student.name == "some name"
    end

    test "create_student/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schools.create_student(@invalid_attrs)
    end

    test "update_student/2 with valid data updates the student" do
      student = student_fixture()
      assert {:ok, %Student{} = student} = Schools.update_student(student, @update_attrs)
      assert student.dob == ~D[2011-05-18]
      assert student.email == "some updated email"
      assert student.name == "some updated name"
    end

    test "update_student/2 with invalid data returns error changeset" do
      student = student_fixture()
      assert {:error, %Ecto.Changeset{}} = Schools.update_student(student, @invalid_attrs)
      assert student == Schools.get_student!(student.id)
    end

    test "delete_student/1 deletes the student" do
      student = student_fixture()
      assert {:ok, %Student{}} = Schools.delete_student(student)
      assert_raise Ecto.NoResultsError, fn -> Schools.get_student!(student.id) end
    end

    test "change_student/1 returns a student changeset" do
      student = student_fixture()
      assert %Ecto.Changeset{} = Schools.change_student(student)
    end
  end

  describe "attendance" do
    alias Skyskool.Schools.Attendance

    @valid_attrs %{attendance_date: ~D[2010-04-17], attendance_type: "some attendance_type"}
    @update_attrs %{attendance_date: ~D[2011-05-18], attendance_type: "some updated attendance_type"}
    @invalid_attrs %{attendance_date: nil, attendance_type: nil}

    def attendance_fixture(attrs \\ %{}) do
      {:ok, attendance} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schools.create_attendance()

      attendance
    end

    test "list_attendance/0 returns all attendance" do
      attendance = attendance_fixture()
      assert Schools.list_attendance() == [attendance]
    end

    test "get_attendance!/1 returns the attendance with given id" do
      attendance = attendance_fixture()
      assert Schools.get_attendance!(attendance.id) == attendance
    end

    test "create_attendance/1 with valid data creates a attendance" do
      assert {:ok, %Attendance{} = attendance} = Schools.create_attendance(@valid_attrs)
      assert attendance.attendance_date == ~D[2010-04-17]
      assert attendance.attendance_type == "some attendance_type"
    end

    test "create_attendance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schools.create_attendance(@invalid_attrs)
    end

    test "update_attendance/2 with valid data updates the attendance" do
      attendance = attendance_fixture()
      assert {:ok, %Attendance{} = attendance} = Schools.update_attendance(attendance, @update_attrs)
      assert attendance.attendance_date == ~D[2011-05-18]
      assert attendance.attendance_type == "some updated attendance_type"
    end

    test "update_attendance/2 with invalid data returns error changeset" do
      attendance = attendance_fixture()
      assert {:error, %Ecto.Changeset{}} = Schools.update_attendance(attendance, @invalid_attrs)
      assert attendance == Schools.get_attendance!(attendance.id)
    end

    test "delete_attendance/1 deletes the attendance" do
      attendance = attendance_fixture()
      assert {:ok, %Attendance{}} = Schools.delete_attendance(attendance)
      assert_raise Ecto.NoResultsError, fn -> Schools.get_attendance!(attendance.id) end
    end

    test "change_attendance/1 returns a attendance changeset" do
      attendance = attendance_fixture()
      assert %Ecto.Changeset{} = Schools.change_attendance(attendance)
    end
  end
end
