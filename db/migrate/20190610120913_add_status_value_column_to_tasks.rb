class AddStatusValueColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :status_value, :integer, null: false, default: 0
  end
end
