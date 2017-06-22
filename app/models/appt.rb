class Appt < ApplicationRecord
  belongs_to :poll
  has_many :responses

  validates :scheduled_slot, presence: true
end
