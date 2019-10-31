# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :course_students
  has_many :students, through: :course_students

  validates_presence_of :name

  def ordered_grades
    course_students.joins(:student).select('students.name, course_students.grade, course_students.id').order('course_students.grade DESC')
  end
end
