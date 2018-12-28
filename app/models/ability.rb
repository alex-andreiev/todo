class Ability
  include CanCan::Ability

  def initialize(user)
    can :access, :rails_admin
    can :manage, :all if user.has_role? :admin
  end
end
