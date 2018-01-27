# in rails 5 controller tests have changed to integration tests
# These are referenced in categories_controller.rb file and also in routes.rb file
require 'test_helper'

class CategoriesControllerTest <  ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sports")
    @user = User.create(username: "Tracey", email: "tracey@example.com", password: "password", admin: true)
  end

  test "should get categories index" do
    get categories_path
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_response :success
  end


  # need ID of the page you're actually trying to go to
  test "should get show" do
    get category_path(@category) # this generates the route for showing the category
    assert_response :success
  end

  #if an admin is not logged in, it should redirect right away, referenced in categories_contoller.rb
  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post categories_path, params:{category: {name: "sports"}}
    end
    assert_redirected_to categories_path
  end
end