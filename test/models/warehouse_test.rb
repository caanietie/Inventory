require "test_helper"

class WarehouseTest < ActiveSupport::TestCase
  def setup
  end
  
  test "should not save warehouse without parameters" do
    warehouse = Warehouse.new
    assert_not warehouse.save
  end

  test "should check validity of warehouse name" do
    msg = "Warehouse name must be present and unique"
    params = [{location: "S", description: "Testing..."},
              {name: "Test", location: "S", description: "Testing..."},
              {name: "Test", location: "P", description: "Testing some more..."}
    ]
    warehouse1 = Warehouse.new params[0]
    warehouse2 = Warehouse.new params[1]
    warehouse3 = Warehouse.new params[2]
    assert_not warehouse1.save, msg
    assert warehouse2.save, msg
    assert_not warehouse3.save, msg
  end

  test "should check presence of warehouse location" do
    msg = "Warehouse location must present and unique"
    params = [{name: "Test", description: "Testing..."},
              {name: "Test", location: "S", description: "Testing..."},
              {name: "Test Test", location: "S", description: "Testing some more..."}
    ]
    warehouse1 = Warehouse.new params[0]
    warehouse2 = Warehouse.new params[1]
    warehouse3 = Warehouse.new params[2]
    assert_not warehouse1.save, msg
    assert warehouse2.save, msg
    assert_not warehouse3.save, msg
  end

  test "should check validity of warehouse description" do
    msg = "Give unique description to warehouse"
    params = [{name: "Test", location: "S"},
              {name: "Test", location: "S", description: "Testing..."},
              {name: "Test Test", location: "P", description: "Testing..."}
    ]
    warehouse1 = Warehouse.new params[0]
    warehouse2 = Warehouse.new params[1]
    warehouse3 = Warehouse.new params[2]
    assert_not warehouse1.save, msg
    assert warehouse2.save, msg
    assert_not warehouse3.save, msg
  end

  def teardown
  end
end
