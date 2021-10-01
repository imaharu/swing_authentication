class PasswordAuthentication < ApplicationRecord
  devise :database_authenticatable

  belongs_to :user
end
