class SessionsController < ApplicationController
# new will be a new form
  def new

  end
# create will create the user and log them in
  # we have the email and password being passed in through params hash
  def create
     @user = User.find_by(email: params[:session][:email].downcase)
    # to check if the above is valid
    if user && user.authenticate(params[:session][:password])
      # this below will allow the browser's cookies to handle storing the user_id in the session and
      # simulate the user log in state (saving the user id in the sessions hash which is backed by browser)
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      # flash.now persists for 1 http request
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end
# this will stop the session and move the user to logged out state
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end