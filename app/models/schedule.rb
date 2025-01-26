class Schedule < ApplicationRecord
  belongs_to :user
  has_many :lessons, dependent: :destroy

  validates :name, length: { maximum: 20 }, presence: true
  validates :explanation, length: { maximum: 30 }, presence: true
end
