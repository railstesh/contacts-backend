class Contact < ApplicationRecord
  validates :first_name, :last_name, :phone_number, presence: true
  validates :email, uniqueness: true
end
