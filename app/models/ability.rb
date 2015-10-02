class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.regular?
      can :read, Video
      can :read, Event
      can :read, Upcoming
    end
  end
end
