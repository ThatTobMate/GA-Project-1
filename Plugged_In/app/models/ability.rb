class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
        can :manage, :all

      elsif user.role? :member
        can [:update, :delete], User do |profile_ability|
          profile_ability.id == user.id 
        end   
    else
        can :index, User
    end
  end
end