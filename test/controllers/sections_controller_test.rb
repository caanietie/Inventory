require "test_helper"

class SectionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @w = Warehouse.first
    @s = Section.find_by warehouse_id: @w.id
  end

  test "should get index" do
    get warehouse_sections_url @w
    assert_response :success
  end

  test "should get show" do
    get warehouse_section_url @w, @s
    assert_response :success
  end

  test "should get new" do
    get new_warehouse_section_url @w
    assert_response :success
  end

  test "should get edit" do
    get edit_warehouse_section_url @w, @s
    assert_response :success
  end

  def teardown
    @w = nil
    @s = nil
  end
end
