class Lesson < ApplicationRecord
  belongs_to :schedule
  belongs_to :subject

  validates :day_of_week, presence: true
  validates :turn, presence: true
end
