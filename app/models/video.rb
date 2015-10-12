class Video < ActiveRecord::Base
  validates_presence_of :title, :event, :url, :speaker_name, :description
  validates :url, format: { with: /\/\/www\.youtube\.com\/watch\?v=([a-zA-Z0-9_-]*)/,
    message: "must be in the format http://www.youtube.com/watch?v=VIDEO_ID" }
  validates :speaker_url, :url => {:allow_blank => true}
  validates_uniqueness_of :url
  validates_uniqueness_of :uid
  belongs_to :event
  belongs_to :user
  has_and_belongs_to_many :tags
  attr_accessor :new_tag_name
  before_update :check_for_new_tags
  has_and_belongs_to_many :playlists
  searchkick

  before_create -> do
    YT_LINK_FORMAT = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i
    uid = url.match(YT_LINK_FORMAT)
    self.uid = uid[2] if uid && uid[2]
   
    Yt.configuration.api_key = "AIzaSyBDXu4NyAry6H2cb1vbOfei2E3yI7nFEsg"
    video = Yt::Video.new id: self.uid
    if self.uid.to_s.length != 11
      self.errors.add(:error, ' - YouTube ID is invalid.')
      false
    elsif not video.hd?
      self.errors.add(:error, ' - only HD videos are supported')
      false
    elsif Video.where(uid: self.uid).any?
      self.errors.add(:error, '- this video has already been added to IgniteTalks.io!')
      false
    else
      begin
        self.likes = video.like_count
        self.dislikes = video.dislike_count
        self.views = video.view_count
      rescue
        self.likes = 0 ; self.dislikes = 0 ; self.views = 0
      end
    end

    # If the user has entered any new tags as free text, add them to the Tags and Video
    check_for_new_tags
  end

  # Friendly IDs in the URL
  extend FriendlyId
  friendly_id :title, :use => :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

  def related_videos
    #Find videos which share the same tag(s)

    Tag.where(id: tags.map(&:id)).joins(:videos).flat_map(&:videos).reject{|video| video.id == id}.reject{|video|}.uniq

    #flat_map takes an array or arrays and flattens it
    #reject knocks out the current video from the related list
    #uniq removes duplicates
  end

  def check_for_new_tags
    #If the user has added any new tags as free text, apply them
    if not new_tag_name.blank?
      @newTag = Tag.create(:name => new_tag_name)
      self.tags.append(@newTag)
    end
  end

end
