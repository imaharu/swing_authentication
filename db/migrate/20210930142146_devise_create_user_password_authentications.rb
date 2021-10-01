# frozen_string_literal: true

class DeviseCreateUserPasswordAuthentications < ActiveRecord::Migration[6.1]
  def change
    create_table :user_password_authentications do |t|
      t.references :user
  
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      t.timestamps null: false
    end

    add_index :user_password_authentications, :email, unique: true
  end
end
