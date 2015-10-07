class Playlist < ActiveRecord::Base
  validates_presence_of :name, :event_id, :user_id
  validates_uniqueness_of :name
  belongs_to :event
  belongs_to :user
  has_and_belongs_to_many :videos
  # searchkick
end
