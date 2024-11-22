# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role?(:admin)
      can :manage, :all
    end

    if user.has_role?(:editor)
      can :read, Post
      can :create, Post
      can [:update, :destroy], Post, user_id: user.id
      can :profile, Post, id: user.id
    end
  end
end
