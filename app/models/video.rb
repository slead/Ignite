class Video < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  has_and_belongs_to_many :tags

  # Friendly IDs in the URL
  extend FriendlyId
  friendly_id :title, :use => :slugged
end
