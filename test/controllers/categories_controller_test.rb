require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  def setup
    @category = Category.create(name: "Hospital")
  end
  test "should get categories index " do
    get :index
    assert_response :success
  end
  test "should get new" do
    get :new
    assert_response :success
  end
  test "show get show" do
    get(:show, params: {'id'=> @category.id })
    assert_response :success
  end
end