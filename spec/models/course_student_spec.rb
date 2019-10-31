# frozen_string_literal: true

require 'rails_helper'

describe CourseStudent, type: :model do
  describe 'validations' do
    it { should validate_presence_of :grade }
  end

  describe 'relationships' do
    it { should belong_to :course }
    it { should belong_to :student }
  end
end
