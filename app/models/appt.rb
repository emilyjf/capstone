class Appt < ApplicationRecord
  belongs_to :poll
  has_many :responses

  # validates :scheduled_slot, presence: true

  def friendly_slot
    scheduled_slot.strftime('%A - %B %e, %l:%M %p')
  end

  def yes_count
    responses.where(answer: "Yes").count
  end

  def no_count
    responses.where(answer: "No").count
  end

  def maybe_count
    responses.where(answer: "Maybe").count
  end

  def date
    scheduled_slot.strftime('%m-%e-%y')
  end

  def time
    scheduled_slot.strftime('%H:%M:%S')
  end
end
