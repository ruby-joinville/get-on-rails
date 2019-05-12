class CreateUserArtistsRelationship < ActiveRecord::Migration[5.2]
  change_table :artists do |t|
    t.belongs_to :user, index: true, null: false
  end
end
