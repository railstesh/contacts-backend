# spec/controllers/edit_versions_controller.rb

require 'rails_helper'

RSpec.describe EditVersionsController, type: :controller do
  describe 'GET #index' do
    let(:contact) { create(:contact) }

    context 'with valid params' do
      before { get :index, params: { contact_id: contact.id } }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'assigns @edit_versions' do
        expect(assigns(:edit_versions)).to eq(contact.edit_versions)
      end

      it 'renders the edit_versions as json' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['edit_versions']).to be_an(Array)
      end
    end

    context 'with invalid params' do
      before { get :index, params: { contact_id: -1 } }

      it 'returns http not found' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
