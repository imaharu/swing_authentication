class User < ApplicationRecord
  devise :authenticatable

  has_one :password_authentication
end
