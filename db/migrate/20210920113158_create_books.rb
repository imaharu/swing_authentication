class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.integer :isbn, null: false
      t.string :title, null: false

      t.timestamps
    end
    add_index :books, :isbn, unique: true
  end
end
