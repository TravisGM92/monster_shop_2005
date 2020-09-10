class UsersController < ApplicationController
  def new; end

  def show
    if User.all == []
      render file: "/public/404"
    else
      @user = User.find(session[:user_id])
    end
  end

  def create
    new_user = User.new(user_params)
    if new_user.save
        flash[:success] = "Welcome #{new_user.name}! Thank you for registering!"
        redirect_to '/profile'
    else
        flash[:name] = "Name field required" if params[:name].empty?
        flash[:address_warning] = "Address field required" if params[:address].empty?
        flash[:city_warning] = "City field required" if params[:city].empty?
        flash[:state_warning] = "State field required" if params[:state].empty?
        flash[:zip_warning] = "Zip field required" if params[:zip].empty?
        flash[:email_warning] = "Email field required" if params[:email].empty?
        flash[:password_warning] = "Password required" if params[:password].empty?
        flash[:password_confirm_warning] = "Password confirmation required" if params[:password_confirmation].empty?
        redirect_to '/register'
    end
  end

  private

  def user_params
    params.permit(:name, :address, :city, :state, :zip, :email, :password, :password_confirmation)
  end
end
