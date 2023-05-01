class EditVersion < ApplicationRecord
  belongs_to :contact

  validates :change_set, presence: true
end
