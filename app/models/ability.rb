class Ability
  include CanCan::Ability

  def initialize user
    return unless user

    if user.has_role? :admin
      can :manage, :all
      can :access, :rails_admin   # only allow admin users to access Rails Admin
      can :read, :dashboard       # allow access to dashboard
    else
      can :read, :all
    end
  end
end
