class ArticlesController < ApplicationController

  # This allows us to go to articles/new URL
  def new
    @article = Article.new
  end

# This allows us to go to articles/create URL
  def create
    # to display what's being passed in from articles/new form
       #  render plain: params[:article].inspect

    # to save what is being passed in from articles/new form
    # we need to create a new instance variable and whitelist
    #the values of article

    @article = Article.new(article_params)
    @article.save
    redirect_to articles_show(@article)
  end

  # This allows us to save the keys from the information we receive
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end