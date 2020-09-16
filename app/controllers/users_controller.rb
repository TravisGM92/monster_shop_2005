class UsersController < ApplicationController

  def new
    @new_user = User.new
  end

  def show
    if User.all == []
      render file: "/public/404"
    else
      @user = current_user
    end
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      session[:user_id] = @new_user.id
      flash[:success] = "Welcome #{@new_user.name}! Thank you for registering!"
      redirect_to "/profile"
    else
      flash[:error] = @new_user.errors.full_messages.to_sentence
      redirect_to '/register'
    end
  end

  private

  def user_params
    params.permit(:name, :address, :city, :state, :zip, :email, :password, :password_confirmation)
  end

end
