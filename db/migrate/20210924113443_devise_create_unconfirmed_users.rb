# frozen_string_literal: true

class DeviseCreateUnconfirmedUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :unconfirmed_users do |t|
      t.string :unconfirmed_email
      t.string :email
      t.string   :confirmation_token, null: false
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at

      t.timestamps null: false
    end

    add_index :unconfirmed_users, :unconfirmed_email,    unique: true
    add_index :unconfirmed_users, :confirmation_token,   unique: true
  end
end
