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

  def show

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