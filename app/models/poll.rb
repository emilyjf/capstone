class Poll < ApplicationRecord
  belongs_to :user, foreign_key: "admin_id"
  has_many :userpolls
  has_many :users, through: :userpolls
  has_many :appts
  has_many :responses

  # validates :title, presence: true
  # validates :status, presence: true
  # validates :invitee, presence: true
  # validates :location, presence: true

  def invite(invitees)
    emails = invitees.gsub(" ", "").split(",")

    emails.each do |email|
      user = User.find_by(email: email)

      if user
        Userpoll.find_or_create_by(user_id: user.id, poll_id: id)
      end
    end
  end

  def finalized?
    appts.where(chosen: true).any?
  end

  def final_time
    appts.find_by(chosen: true).friendly_slot
  end
end
