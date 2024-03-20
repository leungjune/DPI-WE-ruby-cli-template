# item.rb

class Item
  attr_accessor :item_description, :item_date

  def initialize(item_description, item_date)
    @item_description = item_description
    @item_date = item_date
  end
end
