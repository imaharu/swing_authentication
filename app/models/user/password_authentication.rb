class User::PasswordAuthentication < ApplicationRecord
  belongs_to :user
  devise :database_authenticatable
end
