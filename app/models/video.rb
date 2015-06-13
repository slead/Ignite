class Video < ActiveRecord::Base
  belongs_to :event
  has_many :tags

  # Friendly IDs in the URL
  extend FriendlyId
  friendly_id :title, :use => :slugged
end
