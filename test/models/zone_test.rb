require "test_helper"

class ZoneTest < ActiveSupport::TestCase
  def setup
    @w = Warehouse.first
    @s = @w.sections.first
  end
  
  test "should not save zone without parameters" do
    zone = Zone.new
    assert_not zone.save
  end

  test "should check presence of zone name" do
    msg = "Zone name must be present"
    params = [{code: "S", description: "Testing..."},
              {name: "Test", code: "S", description: "Testing..."}
    ]
    zone1 = @s.zones.build params[0]
    zone2 = @s.zones.build params[1]
    assert_not zone1.save, msg
    assert zone2.save, msg
  end

  test "should check presence of zone code" do
    msg = "Code must present"
    params = [{name: "Test", description: "Testing..."},
              {name: "Test", code: "S", description: "Testing..."}
    ]
    zone1 = @s.zones.build params[0]
    zone2 = @s.zones.build params[1]
    assert_not zone1.save, msg
    assert zone2.save, msg
  end

  test "should check presence of zone description" do
    msg = "Describe the zone"
    params = [{name: "Test", code: "S"},
              {name: "Test", code: "S", description: "Testing..."}
    ]
    zone1 = @s.zones.build params[0]
    zone2 = @s.zones.build params[1]
    assert_not zone1.save, msg
    assert zone2.save, msg
  end

  def teardown
    @w = nil
    @s = nil
  end
end
