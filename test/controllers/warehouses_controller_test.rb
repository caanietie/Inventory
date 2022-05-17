require "test_helper"

class WarehousesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @w = Warehouse.first
  end

  test "should get index" do
    get warehouses_url
    assert_response :success
  end

  test "should get show" do
    get warehouse_url @w
    assert_response :success
  end

  test "should get new" do
    get new_warehouse_url
    assert_response :success
  end

  test "should get edit" do
    get edit_warehouse_url @w
    assert_response :success
  end

  def teardown
    @w = nil
  end
end
