class ChangeTaskReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :tasks, :todo, index: true, foreign_key: true
    add_reference :tasks, :user, index: true
  end
end
