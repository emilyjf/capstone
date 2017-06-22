class Poll < ApplicationRecord
  belongs_to :user, foreign_key: "admin_id"
  has_many :userpolls
  has_many :appts

  # validates :title, presence: true
  # validates :status, presence: true
  # validates :invitee, presence: true
  # validates :location, presence: true
end
