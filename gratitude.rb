# gratitude.rb

require_relative "item"

class Gratitude
  def initialize
    @item = []
  end

  def main
    loop do
      puts "\n"
      puts "ACTIONS FOR YOUR GRATITUDE LIST"
      puts "1. Add one thing you are grateful for."
      puts "2. Delete one thing you are not grateful for anymore."
      puts "3. Display your full gratitude list."
      puts "4. Exit"
      print "Choose an option: "
      option = gets.chomp.to_i
      puts "\n"
      case option
      when 1 #add
        print "Enter something you are grateful for: "
        item_description = gets.chomp
        print "Enter date you realized it #{item_description} (YYYY-MM-DD): "
        item_date = gets.chomp
        add_item(item_description, item_date)
      when 2 #delete
        if @item.empty?
          puts "THERE ARE NO GRATITUDE ITEMS TO DELETE."
        else
          puts "HERE ARE ALL THE ITEMS IN YOUR GRATITUDE LIST:"
          list_item
          puts "Enter the line number of the item you want to delete from your gratitude list:"
          index_to_delete = gets.chomp.to_i
          index = index_to_delete -1
          delete_item(index)
          if @item.empty?
            puts "ITEM DELETED. THERE IS NOTHING REMAINING IN YOUR GRATITUDE LIST."
          else
            puts "ITEM DELETED. HERE ARE ALL THE ITEMS IN YOUR GRATITUDE LIST"
            list_item
          end
        end
      when 3 #display full list
        if @item.empty?
          puts "THERE IS NOTHING IN YOUR GRATITUDE LIST TO DISPLAY."
        else
          puts "HERE ARE ALL ITEMS IN YOUR GRATITUDE LIST:"
          list_item
        end
      when 4 #exit app
        exit_app
        puts "EXITING THE GRATITUDE APP. GOODBYE!"
        break
      else #invalid option
        puts " #{option} IS AN INVALID CHOICE. PLEASE TRY AGAIN USING NUMBERS 1-4."
      end
    end
  end

  def add_item(item_description, item_date)
    @item << Item.new(item_description, item_date)
    return "ITEM ADDED!"
  end

  def delete_item(index)
    removed_item = @item.delete_at(index)
    return "ITEM DELETED!"
  end

  def list_item
    @item.each_with_index do |person, index|
      puts "#{index + 1}. #{person.item_description} #{person.item_date}"
    end
    return "FULL GRATITUDE LIST DISPLAYED!"
  end

  def exit_app
    return "GOODBYE!"
  end
end
