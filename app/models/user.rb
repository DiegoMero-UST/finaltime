class User < ApplicationRecord
  has_many :time_records
  
  validates :name, presence: true
end 