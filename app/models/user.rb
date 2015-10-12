class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :videos
  has_and_belongs_to_many :events
  has_many :upcomings
  has_many :posts
  has_many :playlists
  has_many :tags
  validates_presence_of :name, :email
  validates_uniqueness_of :email

  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: "regular" if self.role.nil?
  end

  def admin?
    begin
      if self.role.name == "admin"
        return true
      else
        return false
      end
    rescue Exception => e
      return false
    end
  end

  def regular?
    begin
      if self.role.name == "regular"
        return true
      else
        return false
      end
    rescue Exception => e
      return false
    end
  end

end
