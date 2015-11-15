class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :event_id, :video_ids
end
