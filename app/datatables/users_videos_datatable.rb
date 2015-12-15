class UsersVideosDatatable < AjaxDatatablesRails::Base
  # These are the videos available for a user (ie, owned by an event the user belongs to). The intention
  # is to use this in the Add Videos To Playlist modal.

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(Video.title Video.speaker_name Video.description)
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= %w(Video.title Video.speaker_name Video.description)
  end

  private

  def data
    records.map do |record|
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
        link_to(truncate(record.title, length: 40), edit_video_path(record)),
        record.speaker_name,
        record.description
        record.created_at.strftime("%d %b. %Y")
      ]
    end
  end

  def get_raw_records
    if ['admin', 'curator'].include? options[:role].name
      videos = Video.all.order(:title)
    else
      videos = options[:user].videos.sort_by {|video| video.title}
    end
    @videos = videos - @playlist.videos
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
