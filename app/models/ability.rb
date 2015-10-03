class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    if user.admin?
      can :manage, :all
    elsif user.regular?
      can :read, :all
      can :update, Event do |event|
        # Users can only edit Events to which they have been granted permission
        event.users.map(&:id).include? user.id
      end
      can :create, Video
      can :create, Upcoming
    else
      can :read, :all
    end
  end
end
