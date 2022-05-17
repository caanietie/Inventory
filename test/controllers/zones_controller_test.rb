require "test_helper"

class ZonesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @w = Warehouse.first
    @s = Section.find_by warehouse_id: @w.id
    @z = Zone.find_by section_id: @s.id
  end

  test "should get index" do
    get warehouse_section_zones_url @w, @s
    assert_response :success
  end

  test "should get show" do
    get warehouse_section_zone_url @w, @s, @z
    assert_response :success
  end

  test "should get new" do
    get new_warehouse_section_zone_url @w, @s
    assert_response :success
  end

  test "should get edit" do
    get edit_warehouse_section_zone_url @w, @s, @z
    assert_response :success
  end

  def teardown
    @w = nil
    @s = nil
    @z = nil
  end
end
