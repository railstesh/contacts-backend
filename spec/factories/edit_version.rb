FactoryBot.define do
  factory :edit_version do
    change_set { {first_name: ['John', 'Edited Name']} }
    contact
  end
end
