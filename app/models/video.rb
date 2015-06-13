class Video < ActiveRecord::Base
  belongs_to :event
  has_many :tags
end
