class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles_list = Article.all
  end
  # This allows us to go to articles/new URL
  def new
    @article = Article.new
  end

  def edit

  end

# This allows us to go to articles/create URL
  def create
    # debugger # used to debug errors

    # to display what's being passed in from articles/new form
    # better way to write to save what is being passed in from articles/new form
    # we need to create a new instance variable and whitelist
    # the values of article
    @article = Article.new(article_params)
    # HARD CODING USER to ensure article has a user
    @article.user = User.first

    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
      # display or prevent blank articles from being saved this is done in
      # articles/new.html.erb file
    else
      render 'new'
    end

  end

  def update

    if @article.update(article_params)
      flash[:success] = "Article was updated" # the :success will make the notice green
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  #grabbing from the params hash to find id
  def show

  end

  def destroy

    @article.destroy
    flash[:danger] = "Article was successfully deleted" # the :danger will make the notice red
    redirect_to articles_path

  end

  # This allows us to save the keys from the information we receive
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end