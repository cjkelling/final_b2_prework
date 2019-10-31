# frozen_string_literal: true

require 'rails_helper'

describe 'As a user' do
  describe 'When I visit a student show page' do
    before :each do
      @christopher = Student.create(name: 'Christopher')
      @ruby = Course.create(name: 'Mod 1')
      @rails = Course.create(name: 'Mod 2')
      @student_course = CourseStudent.create(student: @christopher, course: @ruby, grade: 4.0)
      @student_course2 = CourseStudent.create(student: @christopher, course: @rails, grade: 4.0)
    end

    it 'I see all their courses, as well as their grades for that course' do
      visit "/students/#{@christopher.id}"

      expect(page).to have_content(@christopher.name)

      expect(page).to have_content(@student_course.course.name)
      expect(page).to have_content(@student_course.grade)

      expect(page).to have_content(@student_course2.course.name)
      expect(page).to have_content(@student_course2.grade)
    end
  end
end
