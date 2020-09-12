class SessionsController < ApplicationController

  def new

  end

  def create
    if @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
        flash[:success] = "You are now logged in!"
        if @user.role == "merchant"
          redirect_to controller: "merchant/dashboard"
        elsif @user.role == "admin"
          redirect_to controller: "admin/dashboard"
        else
          redirect_to "/profile"
        end
      else
        flash[:failure] = "Uh oh... Wrong email or password. Please try again!"
      end
    else
      flash[:error] = "Hmm... We have no records of this account. Please register before logging in!"
    end
  end

end
