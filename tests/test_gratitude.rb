# tests/test_gratitude.rb

require 'minitest/autorun'
require './item' 
require './gratitude' 

class TestBook < Minitest::Test 
  def test_gratitude
  
    gratitude = Gratitude.new

    # add item to gratitude list
    assert_match "ITEM ADDED!", gratitude.add_item("warm woolen mittens", "1965-03-02"), "ADD FAILED"

    # display full gratitude list
    assert_match "FULL GRATITUDE LIST DISPLAYED!", gratitude.list_item, "DISPLAY FAILED"

    # delete item from gratitude list
    assert_match "ITEM DELETED!", gratitude.delete_item(1), "DELETE FAILED"

    # exit gratitude app
    assert_match "GOODBYE!", gratitude.exit_app, "EXIT FAILED"
  end 
end
