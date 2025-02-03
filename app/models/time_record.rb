class TimeRecord < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :clock_in, presence: true
  validates :user, presence: true

  def worked_hours
    return "En curso" unless clock_out
    
    duration = clock_out - clock_in
    hours = (duration / 1.hour).floor
    minutes = ((duration % 1.hour) / 1.minute).round
    
    format("%02d:%02d", hours, minutes)
  end
end 