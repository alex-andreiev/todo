# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :access, :rails_admin
    can :manage, :all if user.role? :admin
  end
end
