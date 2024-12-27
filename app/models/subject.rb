class Subject < ApplicationRecord
  has_many :lessons, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :color, presence: true, uniqueness: true
end
