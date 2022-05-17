require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @w = Warehouse.first
    @s = Section.find_by warehouse_id: @w.id
    @z = Zone.find_by section_id: @s.id
    @i = Item.find_by zone_id: @z.id
  end

  test "should get index" do
    get warehouse_section_zone_items_url @w, @s, @z
    assert_response :success
  end

  test "should get show" do
    get warehouse_section_zone_item_url @w, @s, @z, @i
    assert_response :success
  end

  test "should get new" do
    get new_warehouse_section_zone_item_url @w, @s, @z
    assert_response :success
  end

  test "should get edit" do
    get edit_warehouse_section_zone_item_url @w, @s, @z, @i
    assert_response :success
  end

  def teardown
    @w = nil
    @s = nil
    @z = nil
    @i = nil
  end
end
