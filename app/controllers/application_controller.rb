class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :cart

  def current_user
    @current_user ||= User.find(session[:current_user]) if session[:current_user]
  end

  def current_user?
    current_user && current_user.default?
  end

  def current_merchant_employee?
    current_user.class == Merchant || current_user && current_user.merchant_employee?
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def cart
    @cart ||= Cart.new(session[:cart] ||= Hash.new(0))
  end

end
