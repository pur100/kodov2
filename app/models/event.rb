class Event < ApplicationRecord
  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?



  CATEGORY = ['Sciences & technologies', 'Histoire & Futur', "Sante & Education", "Economie", "Litterature & Philosophie"]

  validates :title, presence: true
  validates :picture, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: {in: CATEGORY}
  validates :location, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
end
