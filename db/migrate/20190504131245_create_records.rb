class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :name
      t.text :description
      t.float :value

      t.timestamps
    end
  end
end
