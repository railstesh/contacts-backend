require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns all contacts' do
      create_list(:contact, 3)
      get :index
      contacts = JSON.parse(response.body)['contacts']
      expect(contacts.size).to eq(3)
    end
  end

  describe 'GET #show' do
    let(:contact) { create(:contact) }

    it 'returns http success' do
      get :show, params: { id: contact.id }
      expect(response).to have_http_status(:success)
    end

    it 'returns the correct contact' do
      get :show, params: { id: contact.id }
      returned_contact = JSON.parse(response.body)['contact']
      expect(returned_contact['id']).to eq(contact.id)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) { attributes_for(:contact) }

      it 'creates a new contact' do
        expect {
          post :create, params: { contact: valid_params }
        }.to change(Contact, :count).by(1)
      end

      it 'returns http success' do
        post :create, params: { contact: valid_params }
        expect(response).to have_http_status(:success)
      end

      it 'returns the created contact' do
        post :create, params: { contact: valid_params }
        returned_contact = JSON.parse(response.body)['contact']
        expect(returned_contact['email']).to eq(valid_params[:email])
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { attributes_for(:contact, email: nil) }

      it 'does not create a new contact' do
        expect {
          post :create, params: { contact: invalid_params }
        }.not_to change(Contact, :count)
      end

      it 'returns http unprocessable_entity' do
        post :create, params: { contact: invalid_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns an error message' do
        post :create, params: { contact: invalid_params }
        error_message = JSON.parse(response.body)['message']
        expect(error_message).to include("Email can't be blank")
      end
    end
  end

  describe 'PUT update' do
    let!(:contact) { create(:contact) }

    context 'with valid params' do
      let(:valid_params) do
        { id: contact.id, contact: { first_name: 'New', last_name: 'Name' } }
      end

      it 'updates the requested contact' do
        put :update, params: valid_params
        contact.reload
        expect(contact.first_name).to eq('New')
        expect(contact.last_name).to eq('Name')
      end

      it 'returns a success response with the updated contact' do
        put :update, params: valid_params
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
        expect(JSON.parse(response.body)['message']).to eq('Contact was successfully updated.')
      end
    end

    context 'with invalid params' do
      let(:invalid_params) do
        { id: contact.id, contact: { email: '' } }
      end

      it 'returns an unprocessable entity response with the error message' do
        put :update, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
        expect(JSON.parse(response.body)['message']).to eq("Email can't be blank")
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:contact) { create(:contact) }

    it 'destroys the requested contact' do
      expect {
        delete :destroy, params: { id: contact.id }
      }.to change(Contact, :count).by(-1)
    end

    it 'returns a success response with status :ok' do
      delete :destroy, params: { id: contact.id }
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json')
      expect(JSON.parse(response.body)).to eq({ 'status' => 'ok' })
    end
  end
end
