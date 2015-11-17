class EventDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :edit_event_path, :event_path

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(Event.name Event.city Event.country Event.url Event.twitter_name)
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= %w(Event.name Event.city Event.country Event.url Event.twitter_name)
  end

  private

  def data
    records.map do |record|
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
        link_to(record.name, record),
        record.city,
        record.country,
        record.url,
        record.twitter_name,
        link_to("edit", edit_event_path(record)),
        if ['admin', 'curator'].include? options[:role].name
          link_to("delete", event_path(record), method: :delete, data: { confirm: "Are you sure you wish to delete this event?" })
        end
      ]
    end
  end

  def get_raw_records
    # insert query here
    if ['admin', 'curator'].include? options[:role].name
      Event.all
    else
      @events = options[:user].events
    end
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
