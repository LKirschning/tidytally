class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.integer :initial_user
      t.integer :new_user
      t.string :content

      t.timestamps
    end
  end
end
