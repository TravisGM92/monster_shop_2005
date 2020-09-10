class UsersController < ApplicationController
  def new; end

  def show; end

  def create
    @new_user = User.new(user_params)
    if @new_user.valid?
      @new_user.save
      flash[:success] = "Welcome #{@new_user.name}! Thank you for registering!"
      redirect_to '/profile'
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
