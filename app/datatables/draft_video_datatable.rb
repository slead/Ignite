class DraftVideoDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :edit_video_path, :video_path, :truncate

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(Video.title Video.speaker_name Video.created_at Video.featured)
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= %w(Video.title Video.speaker_name Event.name Video.description)
  end

  private

  def data
    records.map do |record|
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
        link_to(truncate(record.title, length: 40), video_path(record)),
        record.speaker_name,
        record.event.name,
        record.created_at.strftime("%d %b. %Y"),
        record.featured,
        link_to("edit", edit_video_path(record)),
        link_to("delete", video_path(record), method: :delete, data: { confirm: "Are you sure you wish to delete this video?" })
      ]
    end
  end

  def get_raw_records
    if ['admin', 'curator'].include? options[:role].name
      Video.where(status: 'draft')
    else
      @videos = options[:user].videos.where(status: 'draft')
    end
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
