class SessionsController < ApplicationController

  def new
    if current_user
      if current_user.role == "merchant_employee"
        redirect_to controller: "merchant/dashboard"
        flash[:notice] = "You're already logged in!"
      elsif current_user.role == "admin"
        redirect_to controller: "admin/dashboard"
        flash[:notice] = "You're already logged in!"
      elsif current_user.role == "default"
        redirect_to "/profile"
        flash[:notice] = "You're already logged in!"
      else
        return
      end
    end
  end

  def create
    if @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = "You are now logged in!"
        if @user.role == "merchant_employee"
          redirect_to controller: "merchant/dashboard"
        elsif @user.role == "admin"
          redirect_to controller: "admin/dashboard"
        else
          redirect_to "/profile"
        end
      else
        flash[:failure] = "Uh oh... Wrong email or password. Please try again!"
        render :new
      end
    else
      flash[:error] = "Hmm... We have no record of this account. Please register before logging in!"
    end
  end

  def destroy
    reset_session
    flash[:success] = "You have logged out. See you next time!"
    redirect_to '/'
  end

end
