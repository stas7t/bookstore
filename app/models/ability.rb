class Ability
  include CanCan::Ability

  def initialize(user, session = nil)
    user ||= User.new
    if user.is_a? Admin
      can :manage, :all
    elsif user.is_a?(User) && user.persisted?
      can :read, [Author, Book, Category, Review]
      can :create, Review, user_id: user.id
      can :manage, User, id: user.id
    else
      can :read, [Author, Book, Category, Review]
    end
  end
end
