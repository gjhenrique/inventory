class Ability
  include CanCan::Ability

  def initialize(user)
  	user ||= User.new
    can :manage, User if user.admin?
	end
end
