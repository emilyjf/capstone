class Response < ApplicationRecord
  belongs_to :user
  belongs_to :appt
  has_one :poll, through: :appt
end
