class Upcoming < ActiveRecord::Base
  validates_presence_of :name, :event, :date
  belongs_to :user
  belongs_to :event
end
