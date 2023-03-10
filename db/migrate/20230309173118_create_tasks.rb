class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :todo, null: false, foreign_key: true
      t.string :action, null: false
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
