class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
        can :manage, :all

    elsif user.role? :member
      can :manage, :all
    #    can [:update, :delete], Profile do |profile_ability|
    #    profile_ability.try(:user_id) == current_user
    #   end
    end   
  end
end