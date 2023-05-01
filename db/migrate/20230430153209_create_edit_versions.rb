class CreateEditVersions < ActiveRecord::Migration[7.0]
  def change
    create_table :edit_versions do |t|
      t.references :contact, null: false, foreign_key: true
      t.json :change_set

      t.timestamps
    end
  end
end
