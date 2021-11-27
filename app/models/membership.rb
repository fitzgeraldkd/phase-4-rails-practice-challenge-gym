class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  # validates :client_id, uniqueness: true
  validate :only_one_membership_with_gym
  validates :client_id, :gym_id, :charge, presence: true

  def only_one_membership_with_gym
    if Membership.where('client_id=? AND gym_id=?', client_id, gym_id).count != 0
      errors.add(:client_id, 'A membership already exists between this client and gym')
    end
  end
end
