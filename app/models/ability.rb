class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :city, :category, :subcategory, :read, to: :search
    alias_action :plus_rating, :minus_rating, to: :vote

    user ||= User.new

    if user.role == "admin"
      can :manage, :all
      cannot :vote, Item, user_id: user.id
    elsif user.role == "user"
      can :new, Item
      can :search, Item
      can :vote, Item
      cannot :vote, Item, user_id: user.id
      can [:edit, :create, :update], Item, user_id: user.id
      cannot :destroy, Item
    else
      can :search, Item
    end
  end
end
