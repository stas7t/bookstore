class Ability
  include CanCan::Ability

  def initialize(user, session = nil)
    user ||= User.new
    if user.is_a? Admin
      can :manage, :all
    elsif user.is_a?(User) && user.persisted?
      can :read, [Author, Book, Category, Coupon, Delivery]
      can %i[read create], Review
      can %i[read create update], [Order, Address, CreditCard], user_id: user.id
      can :create, OrderItem
      can %i[update destroy], OrderItem, id: session[:order_item_ids].to_a
      can :manage, User, id: user.id
    else
      can :read, [Author, Book, Category, Review]
      can :create, OrderItem
      can %i[update destroy], OrderItem, id: session[:order_item_ids].to_a
    end
  end
end
