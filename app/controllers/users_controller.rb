class UsersController < ApplicationController
  def new
  @user = User.new
end

  def show
    if User.all == []
      render file: "/public/404"
    else
      @user = User.last
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.name}! Thank you for registering!"
      redirect_to "/profile"
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      @user.email = "" if @user.errors.details.keys.include?(:email)
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :city, :state, :zip, :email, :password, :password_confirmation)
  end

end
