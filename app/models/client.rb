class Client < ApplicationRecord
  has_many :gyms
  has_many :memberships

  def total_amount_memberships
    self.memberships.sum(:charge)
  end
end
