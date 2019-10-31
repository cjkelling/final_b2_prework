# frozen_string_literal: true

require 'rails_helper'

describe 'As a user' do
  describe 'When I visit a course show page' do
    before :each do
      @rails = Course.create(name: 'Rails')

      @christopher = Student.create(name: 'Christopher')
      @bob = Student.create(name: 'Bob')
      @steve = Student.create(name: 'Steve')

      @student_course = CourseStudent.create(student: @christopher, course: @rails, grade: 3.6)
      @student_course2 = CourseStudent.create(student: @bob, course: @rails, grade: 2.9)
      @student_course3 = CourseStudent.create(student: @steve, course: @rails, grade: 4.0)

      visit course_path(@rails)
    end

    it 'I see the course name, as well as each student in the course, listed in order from highest grade to lowest grade' do
      expect(page).to have_content(@rails.name)

      within "#student-#{@steve.id}" do
        expect(page).to have_content('Name: Steve')
        expect(page).to have_content('Grade: 4.0')
      end

      within "#student-#{@christopher.id}" do
        expect(page).to have_content('Name: Christopher')
        expect(page).to have_content('Grade: 3.6')
      end

      within "#student-#{@bob.id}" do
        expect(page).to have_content('Name: Bob')
        expect(page).to have_content('Grade: 2.9')
      end
    end
  end
end
