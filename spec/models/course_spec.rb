# frozen_string_literal: true

require 'rails_helper'

describe Course, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :course_students }
    it { should have_many(:students).through(:course_students) }
  end

  describe 'methods' do
    it 'ordered_grades' do
      rails = Course.create(name: 'Rails')

      christopher = Student.create(name: 'Christopher')
      bob = Student.create(name: 'Bob')
      steve = Student.create(name: 'Steve')

      course_student = CourseStudent.create(student: christopher, course: rails, grade: 3.6)
      course_student2 = CourseStudent.create(student: bob, course: rails, grade: 2.9)
      course_student3 = CourseStudent.create(student: steve, course: rails, grade: 4.0)

      expect(rails.ordered_grades).to eq([course_student3, course_student, course_student2])
    end
  end
end
