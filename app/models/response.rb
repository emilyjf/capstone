class Response < ApplicationRecord
  belongs_to :user
  belongs_to :appt
  belongs_to :poll
end
