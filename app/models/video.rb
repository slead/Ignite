class Video < ActiveRecord::Base
  validates_presence_of :title, :event, :url, :speaker_name
  validates :url, format: { with: /https:\/\/www\.youtube\.com\/watch\?v=([a-zA-Z0-9_-]*)/,
    message: "must be in the format https://www.youtube.com/watch?v=VIDEO_ID" }
  belongs_to :event
  belongs_to :user
  has_and_belongs_to_many :tags
  searchkick

  # Friendly IDs in the URL
  extend FriendlyId
  friendly_id :title, :use => :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

  def related_videos
    #Find published videos which share the same tag(s)

    Tag.where(id: tags.map(&:id)).joins(:videos).flat_map(&:videos).reject{|video| video.id == id}.reject{|video| video.status != 'published'}.uniq

    #flat_map takes an array or arrays and flattens it
    #reject knocks out the current video from the related list
    #uniq removes duplicates
  end
end
