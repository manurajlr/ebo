class Ability
  include CanCan::Ability

  def initialize(user)
  
    user ||= User.new # guest user (not logged in)
      if user.role.name == "admin"
        can :manage, :all
      elsif user.role.name == "user"
        cannot :manage, :all
      end
  
  
  end
end
