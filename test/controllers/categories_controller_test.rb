# in rails 5 controller tests have changed to integration tests
# These are referenced in categories_controller.rb file and also in routes.rb file
require 'test_helper'

class CategoriesControllerTest <  ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sports")
  end

  test "should get categories index" do
    get categories_path
    assert_response :success
  end

  test "should get new" do
    get new_category_path
    assert_response :success
  end


  # need ID of the page you're actually trying to go to
  test "should get show" do
    get category_path(@category) # this generates the route for showing the category
    assert_response :success
  end
end