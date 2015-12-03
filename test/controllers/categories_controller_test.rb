require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  test "should get shon" do
    get :shon
    assert_response :success
  end

end
