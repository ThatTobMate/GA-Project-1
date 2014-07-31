class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
        can :manage, :all
    elsif user.role? :member
      
      can :show, User do |u|
        u.id = user.id
      end

      can :update, User do |u|
        u.id = user.id
      end


      can :update, Profile do |profile|
        profile.user_id == user.id
      end

      can :update, Post do |post|
        if post.profile
          post.profile.user_id == user.id
        end
      end
      can :delete, Post do |post|
        if post.profile
          post.profile.user_id == user.id
        end
      end

      can :delete, Song do |song|
        song.profile.user_id == user.id
      end

      can :update, Song do |song|
        song.profile.user_id == user.id
      end

      can :delete, Comment do |comment|
        comment.user_id == user.id
      end
      can :update, Comment do |comment|
        comment.user_id == user.id
      end

      can :delete, Album do |album|
        album.user_id == user.id
      end
      can :update, Album do |album|
        album.user_id == user.id
      end

      can :delete, Picture do |picture|
        picture.user_id == user.id
      end
      can :update, Picture do |picture|
        picture.user_id == user.id
      end

    end   
  end
end