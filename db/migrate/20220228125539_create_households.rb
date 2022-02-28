class CreateHouseholds < ActiveRecord::Migration[6.1]
  def change
    create_table :households do |t|
      t.integer :members
      t.integer :rooms

      t.timestamps
    end
  end
end
