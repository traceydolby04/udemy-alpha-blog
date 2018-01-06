class PagesController < ApplicationController

  def home
    # while logged in, you'll be redirected to articles page and will not hit the home page
    redirect_to articles_path if logged_in?
  end

  def about

  end
end