class UserDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :edit_user_path, :user_path

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(User.name User.email Role.name)
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= %w(User.name User.email Role.name)
  end

  private

  def data
    records.map do |record|
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
        link_to(record.name, user_path(record)),
        record.email,
        record.role.name,
        link_to("edit", edit_user_path(record)),
        link_to("delete", user_path(record), method: :delete, data: { confirm: "Are you sure you wish to delete this user?" })
      ]
    end
  end

  def get_raw_records
    # insert query here
    if ['admin', 'curator'].include? options[:role].name
      User.joins(:role)
    end
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
