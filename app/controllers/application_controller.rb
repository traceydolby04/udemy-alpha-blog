class ApplicationController < ActionController::Base
  # prevent CSRF attacks by raising an exeption
  # for APIs you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # the methods below are all available to any of the controllers in the folder but not available
  # to views by default

  # in order for views to have access we need to let rails know current_user and logged_in? are helper methods
  helper_method :current_user, :logged_in?

  def current_user
    # we're saying return this user if session user_id which is stored is backed by our browser
    # then find the user in the DB based on user_id
  @current_user ||= User.find(session[:user_id]) if session[:user_id]

  end

# to see if current_user is true to convert anything to a boolean use !!
  def logged_in?
  !!current_user
  end

  # for certain actions we want to restrict based on if there is a logged in user or not
  def require_user
   if !logged_in?
     flash[:danger] = "You must be logged in to perform that action"
     redirect_to root_path
   end
  end
end
