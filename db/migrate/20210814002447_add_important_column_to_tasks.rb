class AddImportantColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :important, :boolean
  end
end
