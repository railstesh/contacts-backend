class EditVersionsController < ApplicationController
  before_action :get_contact, only: %i[ index ]

  # GET /edit_versions or /edit_versions.json
  def index
    @edit_versions = @contact.edit_versions
    render json: { edit_versions: @edit_versions, status: :ok }
  end

  private

  def get_contact
    @contact ||= Contact.find(params[:contact_id])
  end
end
