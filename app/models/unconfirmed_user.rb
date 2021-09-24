class UnconfirmedUser < ApplicationRecord
  devise :confirmable
end
