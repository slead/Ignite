class Tag < ActiveRecord::Base
  has_and_belongs_to_many :videos
  belongs_to :user
  validates_presence_of :name
  validates_uniqueness_of :name

  # Friendly IDs in the URL
  extend FriendlyId
  friendly_id :name, :use => :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end
  
end