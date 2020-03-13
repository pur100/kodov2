class Speaker < ApplicationRecord
  has_many :events, through: :contributions

  validates :first_name, presence: true
  validates :last_name, presence: true
end
