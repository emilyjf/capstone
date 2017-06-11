class Poll < ApplicationRecord
  belongs_to :user, foreign_key: "admin_id"
  has_many :userpolls
  has_many :appts

  validates :
end
