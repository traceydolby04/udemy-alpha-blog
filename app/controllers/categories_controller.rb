class CategoriesController < ApplicationController
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

end