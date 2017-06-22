class User < ApplicationRecord
  has_secure_password
  has_many :userpolls
  has_many :polls, through: :userpolls
  
  has_many :responses
  has_many :appts, through: :responses

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, confirmation: true
end
