class AddNameToHouseholds < ActiveRecord::Migration[6.1]
  def change
    add_column :households, :name, :string
  end
end
