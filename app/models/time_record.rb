class TimeRecord < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :clock_in, presence: true
  validates :user, presence: true
end 