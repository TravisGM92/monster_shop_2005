class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :cart, :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # if session[:user_id].nil?
    #   @current_user = User.last
    # else
    #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # end
  end

  def current_merchant_employee?
    current_user && current_user.merchant_employee?
  end

  def current_admin_user?
    current_user && current_user.admin?
  end

  def cart
    @cart ||= Cart.new(session[:cart] ||= Hash.new(0))
  end

end
