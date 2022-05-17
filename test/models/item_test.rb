require "test_helper"

class ItemTest < ActiveSupport::TestCase
  def setup
    @w = Warehouse.first
    @s = @w.sections.first
    @z = @s.zones.first
  end
  
  test "should not save item without parameters" do
    item = Item.new
    assert_not item.save
  end

  test "should check presence of item name" do
    msg = "Item name must be present"
    params = [{code: "S8", quantity: 1, measure: "kg", description: "Testing..."},
              {name: "Test", code: "S8", quantity: 1, measure: "kg", description: "Testing..."}
    ]
    item1 = @z.items.build params[0]
    item2 = @z.items.build params[1]
    assert_not item1.save, msg
    assert item2.save, msg
  end

  test "should check validity of item code" do
    msg = "Code must have length of 2"
    params = [{name: "Test", code: "S", quantity: 1, measure: "kg", description: "Testing..."},
              {name: "Test", code: "S8", quantity: 1, measure: "kg", description: "Testing..."}
    ]
    item1 = @z.items.build params[0]
    item2 = @z.items.build params[1]
    assert_not item1.save, msg
    assert item2.save, msg
  end

  test "should check validity of item quantity" do
    msg = "Quantity must be present and must be a number"
    params = [{name: "Test", code: "S8", measure: "kg", description: "Testing..."},
              {name: "Test", code: "S8", quantity: ?A, measure: "kg", description: "Testing..."},
              {name: "Test", code: "S8", quantity: 1, measure: "kg", description: "Testing..."}
    ]
    item1 = @z.items.build params[0]
    item2 = @z.items.build params[1]
    item3 = @z.items.build params[2]
    assert_not item1.save, msg
    assert_not item2.save, msg
    assert item3.save, msg
  end

  test "should check presence of item unit of measure" do
    msg = "Unit of measure must be present"
    params = [{name: "Test", code: "S8", quantity: 1, description: "Testing..."},
              {name: "Test", code: "S8", quantity: 1, measure: "kg", description: "Testing..."}
    ]
    item1 = @z.items.build params[0]
    item2 = @z.items.build params[1]
    assert_not item1.save, msg
    assert item2.save, msg
  end

  test "should check presence of item description" do
    msg = "Describe the item"
    params = [{name: "Test", code: "S8", quantity: 1, measure: "kg"},
              {name: "Test", code: "S8", quantity: 1, measure: "kg", description: "Testing..."}
    ]
    item1 = @z.items.build params[0]
    item2 = @z.items.build params[1]
    assert_not item1.save, msg
    assert item2.save, msg
  end
  
  def teardown
    @w = nil
    @s = nil
    @z = nil
  end
end
