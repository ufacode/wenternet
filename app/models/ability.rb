class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :city, :category, :subcategory, :read, to: :search

    user ||= User.new

    if user.role == "admin"
      can :manage, :all
    elsif user.role == "user"
      can :new, Item
      can :search, Item
      can [:edit, :create, :update], Item, user_id: user.id
      cannot :destroy, Item
    else
      can :search, Item
    end
  end
end
