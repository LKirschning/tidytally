class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.integer :time_estimate
      t.boolean :completed
      t.date :date

      t.timestamps
    end
  end
end
