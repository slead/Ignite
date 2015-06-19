class Video < ActiveRecord::Base
  validates_presence_of :title, :event, :url
  belongs_to :event
  belongs_to :user
  has_and_belongs_to_many :tags
  searchkick autocomplete: ['title']

  # Friendly IDs in the URL
  extend FriendlyId
  friendly_id :title, :use => :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

  def related_videos
    #Find videos which share the same tag(s)

    Tag.where(id: tags.map(&:id)).joins(:videos).flat_map(&:videos).reject{|video| video.id == id}.uniq

    #flat_map takes an array or arrays and flattens it
    #reject knocks out the current video from the related list
    #uniq removes duplicates
  end
end
