class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.boolean :status, default: 'false'
      t.string :category, null: false, default: 'general'
      t.text :note
      t.datetime :deadline

      t.timestamps
    end
  end
end
