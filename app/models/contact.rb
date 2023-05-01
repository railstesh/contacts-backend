class Contact < ApplicationRecord
  validates :first_name, :last_name, :phone_number, presence: true
  validates :email, uniqueness: true
  has_many :edit_versions, dependent: :destroy

  before_update :create_edit_history

  private

  def create_edit_history
    # Only create a new EditVersion record if any of the contact's attributes have changed.
    if changes_to_save.any?
      edit_versions.create(change_set: changes_to_save.except(:updated_at))
    end
  end
end
