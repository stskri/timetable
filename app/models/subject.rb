class Subject < ApplicationRecord
  has_many :lessons, dependent: :destroy
end
