class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ShoppingCart::CurrentSession

  helper ShoppingCart::Engine.helpers

  private

  def current_ability
    @current_ability ||= Ability.new(current_user, session)
  end
end
