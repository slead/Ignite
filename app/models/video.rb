class Video < ActiveRecord::Base
  validates_presence_of :title, :event, :url, :speaker_name
  validates :url, format: { with: /https:\/\/www\.youtube\.com\/watch\?v=([a-zA-Z0-9_-]*)/,
    message: "must be in the format https://www.youtube.com/watch?v=VIDEO_ID" }
  belongs_to :event
  belongs_to :user
  has_and_belongs_to_many :tags
  searchkick

  Yt.configure do |config|
    config.api_key = 'AIzaSyCPOAgGgCNBrHB1trDKtv6rdjWpzObqxLM'
  end

  before_create -> do
    YT_LINK_FORMAT = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i
    uid = url.match(YT_LINK_FORMAT)
    self.uid = uid[2] if uid && uid[2]
   
    if self.uid.to_s.length != 11
      self.errors.add(:link, 'is invalid.')
      false
    elsif Video.where(uid: self.uid).any?
      self.errors.add(:link, 'is not unique.')
      false
    else
      get_video_info
    end
  end

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

  private
 
  def get_video_info
    begin
      video = Yt::Video.new id: uid
      self.likes = video.like_count
      self.dislikes = video.dislike_count
      self.views = video.view_count
    rescue
      self.likes = 0 ; self.dislikes = 0 ; self.views = 0
    end
  end
end
