class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5) # found in index.html.erb
  end

  def new
    @category = Category.new  #referenced in categories/new.html.erb
  end

  def create
    @category = Category.new(category_params) #whitelist name
    if @category.save
      flash[:success] = "Category was created successfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end
   # this will be handled by the update form section
  def edit
    @category = Category.find(params[:id]) # finding the category we want to edit,by initializing the instance variable
  end
  #this should handle the edit section and only admins should have access to it because of the rules above
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params) # reusing the category_params method we have defined below.
      flash[:success] = "Category name was successfully updated"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def show
    @category = Category.find(params[:id])
    @category_articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end

  private # this is only accessible to the categories controller
  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !logged_in? || (logged_in? and !current_user.admin?)
      flash[:danger] = "only admins can perform that action"
      redirect_to categories_path
    end
  end
end