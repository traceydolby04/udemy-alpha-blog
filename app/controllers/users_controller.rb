class UsersController < ApplicationController

  def index
    @users = User.all
  end

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
#initializing the users controller from users/edit.html.erb
  def edit
    @user = User.find(params[:id])
  end
#using the whitelist params below for if statement
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to articles_path

    else
      render 'edit'

    end
  end
 # we want to find the user using id then display
  def show
    @user = User.find(params[:id])
  end

  # we need to whitelist what we're accepting, and be able to create a new user with the params through
  # the params hash
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end