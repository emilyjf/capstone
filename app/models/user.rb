class User < ApplicationRecord
  has_secure_password
  has_many :userpolls
  has_many :responses
  has_many :appts, through: :responses
end
