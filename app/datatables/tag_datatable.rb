class TagDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :edit_tag_path, :tag_path, :truncate

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(Tag.name Tag.video_count)
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= %w(Tag.name Tag.video_count)
  end

  private

  def data
    records.map do |record|
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
        truncate(record.name, length: 40),
        record.video_count,
        link_to("edit", edit_tag_path(record)),
        link_to("delete", tag_path(record), method: :delete, data: { confirm: "Are you sure you wish to delete this tag?" })
      ]
    end
  end

  def get_raw_records
    # insert query here
    Tag.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
