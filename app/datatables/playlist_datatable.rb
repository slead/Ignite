class PlaylistDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :edit_playlist_path, :playlist_path, :truncate

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(Playlist.name Event.name Playlist.featured Playlist.listed Playlist.video_count)
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= %w(Playlist.name Event.name)
  end

  private

  def data
    records.map do |record|
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,record.speaker_name,
        link_to(truncate(record.name, length: 40), playlist_path(record)),
        record.event.name,
        record.featured,
        record.listed,
        record.video_count,
        link_to("edit", edit_playlist_path(record)),
        link_to("delete", playlist_path(record), method: :delete, data: { confirm: "Are you sure you wish to delete this playlist?" })
      ]
    end
  end

  def get_raw_records
    # insert query here
    if ['admin', 'curator'].include? options[:role].name
      Playlist.joins(:event)
    else
      @playlists = options[:user].playlists.joins(:event)
    end
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
