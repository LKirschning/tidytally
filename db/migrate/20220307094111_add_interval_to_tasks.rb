class AddIntervalToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :interval, :integer
  end
end
