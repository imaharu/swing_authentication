class CreatePasswordAuthentications < ActiveRecord::Migration[6.1]
  def change
    create_table :password_authentications do |t|
      t.references :user, foreign_key: true, index: {unique: true}
      ## Database authenticatable
      t.string :email,              null: false
      t.string :encrypted_password, null: false

      t.timestamps null: false
    end

    add_index :password_authentications, :email, unique: true
  end
end
