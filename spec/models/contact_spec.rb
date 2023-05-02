# spec/models/contact_spec.rb

require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject(:contact) { described_class.new(first_name: 'John', last_name: 'Doe', email: 'johndoe@example.com', phone_number: '123-456-7890') }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:edit_versions).dependent(:destroy) }
  end

  describe 'callbacks' do
    describe '#create_edit_history' do
      let(:contact) { create(:contact, first_name: 'John', last_name: 'Doe', email: 'johndoe@example.com', phone_number: '123-456-7890') }

      it 'creates a new edit version when a contact attribute is updated' do
        expect { contact.update(first_name: 'Jane') }.to change { contact.edit_versions.count }.by(1)
      end

      it 'does not create a new edit version when no contact attributes are updated' do
        expect { contact.update(updated_at: Time.now) }.not_to change { contact.edit_versions.count }
      end
    end
  end
end
