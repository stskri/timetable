class Schedule < ApplicationRecord
  belongs_to :user
  has_many :lessons, dependent: :destroy

  validates :name, length: { maximum: 20 }, presence: true
end
