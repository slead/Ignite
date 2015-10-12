class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    if user.admin?
      # Admin users have full control
      can :manage, :all

    elsif user.regular?
      # Regular users can create videos and upcoming events, and can edit videos
      # pertaining to events they own
      can :read, Video
      can :read, Playlist
      can :read, Event
      can :read, Tag

      can :create, Video
      can :create, Playlist
      can :create, Upcoming
      can :create, Tag

      can :update, Event do |event|
        # Users can only edit Events to which they have been granted permission
        event.users.map(&:id).include? user.id
      end

      can :update, Video do |video|
        # Users can only edit Videos belonging Events to which they have been granted permission
        video.event.users.map(&:id).include? user.id
      end

      can :update, Playlist do |playlist|
        # Users can only edit Playlists belonging Events to which they have been granted permission
        playlist.event.users.map(&:id).include? user.id
      end

      can :destroy, Video do |video|
        # Users can only destroy Videos belonging Events to which they have been granted permission
        video.event.users.map(&:id).include? user.id
      end

      can :destroy, Playlist do |playlist|
        # Users can only destroy Playlists belonging Events to which they have been granted permission
        playlist.event.users.map(&:id).include? user.id
      end

      can :update, Upcoming do |upcoming|
        # Users can only edit Upcomings belonging Events to which they have been granted permission
        upcoming.event.users.map(&:id).include? user.id
      end

    else
      can :read, :all
    end
  end
end
