class UpcomingDatatable < AjaxDatatablesRails::Base

  def_delegators :@view, :link_to, :edit_upcoming_path, :upcoming_path

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(Upcoming.name Event.name Upcoming.date) #Event.name
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= %w(Upcoming.name Event.name Upcoming.date) #Event.name
  end

  private

  def data
    records.map do |record|
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
        record.name,
        record.event.name,
        record.date.strftime("%d %b. %Y"),
        link_to("edit", edit_upcoming_path(record)),
        link_to("delete", upcoming_path(record), method: :delete, data: { confirm: "Are you sure you wish to delete this upcoming?" })
      ]
    end
  end

  def get_raw_records
    # insert query here
    if ['admin', 'curator'].include? options[:role].name
      Upcoming.joins(:event)
    else
      @upcomings = options[:user].upcomings.joins(:event)
    end
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
