class Event < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :picture, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
end
