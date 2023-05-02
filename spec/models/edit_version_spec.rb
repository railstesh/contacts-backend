# spec/models/contact_spec.rb

require 'rails_helper'

RSpec.describe EditVersion, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:change_set) }
  end

  describe 'associations' do
    it { should belong_to(:contact) }
  end
end
