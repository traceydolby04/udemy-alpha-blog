class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
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
    # @user = User.find(params[:id]) ## because of the before_action we don't need this line
  end
#using the whitelist params below for if statement
  def update
    # @user = User.find(params[:id])## see above before_action
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to articles_path

    else
      render 'edit'

    end
  end
 # we want to find the user using id then display
  # we are grabbing the individual user from the show.html.erb view
  def show
    # @user = User.find(params[:id]) ## see above before_action
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  # we need to whitelist what we're accepting, and be able to create a new user with the params through
  # the params hash
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end
end