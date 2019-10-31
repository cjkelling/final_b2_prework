# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :course_students
  has_many :students, through: :course_students

  validates_presence_of :name
end
