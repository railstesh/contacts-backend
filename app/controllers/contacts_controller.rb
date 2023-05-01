class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show update destroy ]

  # GET /contacts or /contacts.json
  def index
    @contacts = Contact.all
    render json: {contacts: @contacts}
  end

  # GET /contact/:id
  def show
    render json: {contact: @contact}
  end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: { message: "Contact was successfully created.", status: :ok }
    else
      render json: { message: @contact.errors.full_messages.to_sentence, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    if @contact.update(contact_params)
      render json: { message: "Contact was successfully updated.", status: :ok }
    else
      render json: { message: @contact.errors.full_messages.to_sentence, status: :unprocessable_entity }
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy

    render json: { status: :ok }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :phone_number)
    end
end
