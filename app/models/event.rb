class Event < ActiveRecord::Base
  validates_presence_of :name, :city
  validates_uniqueness_of :name
  validates :url, :url => {:allow_blank => true}
  has_many :videos, dependent: :destroy
  has_many :upcomings, dependent: :destroy
  has_and_belongs_to_many :users
  has_many :playlists, dependent: :destroy

  # Geocoding
  geocoded_by :city
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      # obj.city = geo.city
      obj.state = geo.state
      obj.country = geo.country
    end
  end
  after_validation :geocode, if: :city_changed?
  after_validation :reverse_geocode, if: :city_changed?

  # Friendly IDs in the URL
  extend FriendlyId
  friendly_id :name, :use => :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end

  def remove_ignite
    name.sub("Ignite ","")
  end

end
