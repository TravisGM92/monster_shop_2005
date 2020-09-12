class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    flash[:success] = "You are now logged in!"
    redirect_to "/profile"
  end

end
