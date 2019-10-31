# frozen_string_literal: true

class Student < ApplicationRecord
  has_many :course_students
  has_many :courses, through: :course_students

  validates_presence_of :name

  def grade(course)
    course_students.find_by(student: self, course: course).grade
  end
end
