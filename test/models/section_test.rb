require "test_helper"

class SectionTest < ActiveSupport::TestCase
  def setup
    @w = Warehouse.first
  end
  
  test "should not save section without parameters" do
    section = Section.new
    assert_not section.save
  end

  test "should check validity of section name" do
    msg = "Section name must be present and unique"
    params = [{code: "S", description: "Testing..."},
              {name: "Test", code: "S", description: "Testing..."},
              {name: "Test", code: "P", description: "Testing some more..."}
    ]
    section1 = @w.sections.build params[0]
    section2 = @w.sections.build params[1]
    section3 = @w.sections.build params[2]
    assert_not section1.save, msg
    assert section2.save, msg
    assert_not section3.save, msg
  end

  test "should check presence of section code" do
    msg = "Section code must present and unique"
    params = [{name: "Test", description: "Testing..."},
              {name: "Test", code: "S", description: "Testing..."},
              {name: "Test Test", code: "S", description: "Testing some more..."}
    ]
    section1 = @w.sections.build params[0]
    section2 = @w.sections.build params[1]
    section3 = @w.sections.build params[2]
    assert_not section1.save, msg
    assert section2.save, msg
    assert_not section3.save, msg
  end

  test "should check validity of section description" do
    msg = "Give unique description to section"
    params = [{name: "Test", code: "S"},
              {name: "Test", code: "S", description: "Testing..."},
              {name: "Test Test", code: "P", description: "Testing..."}
    ]
    section1 = @w.sections.build params[0]
    section2 = @w.sections.build params[1]
    section3 = @w.sections.build params[2]
    assert_not section1.save, msg
    assert section2.save, msg
    assert_not section3.save, msg
  end

  def teardown
    @w = nil
  end
end
