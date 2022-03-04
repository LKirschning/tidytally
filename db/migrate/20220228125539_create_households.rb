class CreateHouseholds < ActiveRecord::Migration[6.1]
  def change
    create_table :households do |t|
      t.integer :members
      t.integer :rooms

      # t.references :user, foreign_key: true
      t.belongs_to :user
      t.timestamps
    end
  end
end
