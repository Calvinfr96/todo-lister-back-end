class AddUserAndCategoryToTask < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :user, foreign_key: true
    add_reference :tasks, :category, foreign_key: true
  end
end