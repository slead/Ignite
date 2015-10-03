class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    if user.admin?
      can :manage, :all
    elsif user.regular?
      can :read, :all
      can :create, Video
      can :create, Upcoming
    else
      can :read, :all
    end
  end
end
