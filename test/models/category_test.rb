require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "sports")
  end

  test "category should me valid" do
assert @category.valid?
  end
  test "category name should be present" do
    @category.name =" "
    assert_not @category.valid?
  end
  test "category name should be unique" do
    @category.save
    @category_same = Category.new(name: "sports")
    assert_not @category_same.valid?
  end

  test "name should not be too short" do
    @category_short = Category.new(name: "AB")
    assert_not @category_short.valid?

  end

  test "name should not be too long" do
    @category_long = Category.new(name: "Alpha beta gamma blog og Princy Bathla that is too large to handle")
    assert_not @category_long.valid?
  end

end