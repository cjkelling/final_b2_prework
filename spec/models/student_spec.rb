# frozen_string_literal: true

require 'rails_helper'

describe Student, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :course_students }
    it { should have_many(:courses).through(:course_students) }
  end

  describe 'methods' do
    it 'grade' do
      christopher = Student.create(name: 'Christopher')

      rails = Course.create(name: 'Rails')

      CourseStudent.create(student: christopher, course: rails, grade: 3.6)

      expect(christopher.grade(rails)).to eq(3.6)
    end
  end
end
