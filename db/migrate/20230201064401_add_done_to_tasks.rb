class AddDoneToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :done, :boolean, nill: false, default: false
  end
end
