class Ability
  include CanCan::Ability

  def initialize user
    return unless user

    can :read, :all
    can :access, :ckeditor        # needed to access Ckeditor filebrowser
    if user.has_role? :admin
      can :manage, :all
      can :access, :rails_admin   # only allow admin users to access Rails Admin
      can :read, :dashboard       # allow access to dashboard
    elsif user.has_role? :staff
      can :manage, Speech, user_id: user.id
    end
  end
end
