class EventDatatable < AjaxDatatablesRails::Base

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(Event.name Event.city)
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= %w(Event.name Event.city)
  end

  private

  def data
    records.map do |record|
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
        record.name,
        record.city,
        record.url,
        record.latitude,
        record.longitude
      ]
    end
  end

  def get_raw_records
    # insert query here
    Event.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
