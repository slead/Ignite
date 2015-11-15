class VideoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :speaker_name, :url, :uid, :event_id, :tag_ids, :playlist_ids
end
