class Upcoming < ActiveRecord::Base
  validates_presence_of :name, :ignite, :date
  belongs_to :user
  belongs_to :ignite
end
