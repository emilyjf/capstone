class Appt < ApplicationRecord
  belongs_to :poll
  has_many :responses
end
