class UsersController < ApplicationController
  def new
    @user = User.new
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

  def edit
    @user = User.last
  end

  def update
    current_user.update(name: params[:name], address: params[:address], city: params[:city], state: params[:state], zip: params[:zip], email: params[:email])
    flash[:success] = "Profile updated"
    redirect_to("/profile")
  end

  def password_update
    @user = User.last
  end

  def new_password
    current_user.update(password_confirmation: params[:password_digest])
    flash[:success] = "Your password has been updated"
    redirect_to("/profile")
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :city, :state, :zip, :email, :password, :password_confirmation)
  end

end
