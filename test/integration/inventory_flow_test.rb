require "test_helper"

class InventoryFlowTest < ActionDispatch::IntegrationTest
  test "can see warehouse index page" do
    get "/"
    assert_select "h1", "Warehouses"
  end
end
