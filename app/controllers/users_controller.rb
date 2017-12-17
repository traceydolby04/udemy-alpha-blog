class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
 # private method
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Alpha Blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  # we need to whitelist what we're accepting, and be able to create a new user with the params through
  # the params hash
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end