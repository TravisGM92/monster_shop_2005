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
      # respond_to do |format| 
      #   format.html { redirect_to '/' }
      # end
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_to '/register'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :city, :state, :zip, :email, :password, :password_confirmation)
  end

end
