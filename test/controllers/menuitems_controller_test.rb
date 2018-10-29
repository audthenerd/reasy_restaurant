require 'test_helper'

class MenuitemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get menuitems_index_url
    assert_response :success
  end

  test "should get new" do
    get menuitems_new_url
    assert_response :success
  end

  test "should get show" do
    get menuitems_show_url
    assert_response :success
  end

  test "should get edit" do
    get menuitems_edit_url
    assert_response :success
  end

end
