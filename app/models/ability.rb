class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    if user.admin?
      can :manage, :all
    elsif user.regular?
      can :read, Video
      can :create, Video
      can :read, Upcoming
      can :create, Upcoming
      can :read, Event
    else
      can :read, :all
    end
  end
end
