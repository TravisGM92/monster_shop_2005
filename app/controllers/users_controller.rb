class UsersController < ApplicationController
  def new
  @new_user = User.new
end

  def show
    if User.all == []
      render file: "/public/404"
    elsif current_user.nil?
      @user = User.last
    else
      @user = current_user
    end
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      flash[:success] = "Welcome #{@new_user.name}! Thank you for registering!"
      redirect_to "/profile"
    else
      flash[:error] = @new_user.errors.full_messages.to_sentence
      redirect_to '/register'
    end
  end

  def edit
    @user = User.last
  end

  def update
    current_user.update(user_params)
    flash[:success] = "Profile updated"
    redirect_to("/profile")
  end

  private

  def user_params
    params.permit(:name, :address, :city, :state, :zip, :email, :password, :password_confirmation)
  end

end
