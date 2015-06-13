class Event < ActiveRecord::Base
  validates_presence_of :name, :city, :url
  has_many :videos, dependent: :destroy
  # belongs_to :user

  # Geocoding
  geocoded_by :city
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.state = geo.state
      obj.country = geo.country
    end
  end
  after_validation :geocode, if: :city_changed?
  after_validation :reverse_geocode, if: :city_changed?

  # Friendly IDs in the URL
  extend FriendlyId
  friendly_id :name, :use => :slugged
end
