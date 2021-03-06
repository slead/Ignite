class Playlist < ActiveRecord::Base
  validates_presence_of :name, :event
  validates_uniqueness_of :name
  belongs_to :event
  has_and_belongs_to_many :videos
  # searchkick

  # Friendly IDs in the URL
  extend FriendlyId
  friendly_id :name, :use => :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end

end
