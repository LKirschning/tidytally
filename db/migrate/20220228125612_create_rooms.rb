class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.references :household, null: false, foreign_key: true
      t.boolean :is_common

      t.timestamps
    end
  end
end
