class Membership < ApplicationRecord
   validates :client_id, uniqueness: {
    scope: :gym_id,
    message: "Only one membership per client per gym"
  }

  belongs_to :gym
  belongs_to :client
end
