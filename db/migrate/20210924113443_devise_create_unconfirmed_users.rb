# frozen_string_literal: true

class DeviseCreateUnconfirmedUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :unconfirmed_users do |t|
      t.string :email,              null: false
      t.string   :confirmation_token, null: false
      t.datetime :confirmation_sent_at, null: false

      t.timestamps null: false
    end

    add_index :unconfirmed_users, :email,                unique: true
    add_index :unconfirmed_users, :confirmation_token,   unique: true
  end
end
