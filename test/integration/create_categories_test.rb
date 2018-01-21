require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  test "get new category form and create category" do
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do # there should be a difference in
      # category count of 1 after the do action

      # the submission of a new form is handled by the
      #create action which is an HTTP post request to the categories path to the create action
      # we need to pass in the category name.
      post categories_path, params:{category:{name: "sports"}}
      follow_redirect!
    end

    assert_template 'categories/index'
    assert_match "sports", response.body
  end

end