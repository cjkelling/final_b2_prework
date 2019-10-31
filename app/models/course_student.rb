# frozen_string_literal: true

class CourseStudent < ApplicationRecord
  belongs_to :course
  belongs_to :student

  validates_presence_of :grade
  validates_numericality_of :grade, greater_than_or_equal_to: 0.0
end
