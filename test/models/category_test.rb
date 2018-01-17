require 'test_helper'

#testing the category model that we're able to creat a new category
class CategoryTest < ActiveSupport::TestCase

  # this method runs before each one of the tests
  def setup
    @category = Category.new(name: "sports") # this hits test database which we want to keep clean
  end

  # can we initiate a category instance variable and is it valid this test will reference the app/models
  test "category should be valid" do
    assert @category.valid?
  end

  # negative test case to make sure category isn't valid we're expecting a false return
  test "name should be present" do
    @category.name = " "
    assert_not @category.valid? # refers to category.rb name validation
  end

  # negative test case to make sure we can't have two categories with same name
  test "name should be unique" do
    @category.save #hits test DB first
    category2 = Category.new(name: "sports")
    assert_not category2.valid? # refers to category.rb category validation
  end

  # negative test case to make sure name isn't > 25 characters
  test "name should not be too long" do
    @category.name = "a" * 26 # this will input a string of 26 when we want a max 25
    assert_not @category.valid? # refers to category.rb file
  end

  # negative test case to make sure the name isn't < 3 characters
  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid? # refers to category.rb file
  end

end