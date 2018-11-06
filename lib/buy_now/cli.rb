require 'colorize'
class BuyNow::CLI
 attr_accessor :buy
  def call
    list_buy
    menu
    goodbye
  end

  def list_buy
    # here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    puts "                         --------------------"
    puts "                          Welcome to Buy Now!      ".yellow
    puts "                         --------------------"
    puts "\nToday's item to buy:".cyan
    @buy = BuyNow::Buy.buying
    @buy.each.with_index(1) do |now, i|
      puts "#{i}."
      puts "Product: #{now.name}"
      puts "Price: #{now.price}"
      puts "Availability: #{now.availability}"
      puts
    end
  end

  def goodbye
    puts "See you tomorrow for more shopping 👋!!!".blue
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the item you'd like more info on or type list to see the items again or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        the_now = @buy[input.to_i-1]
        puts "#{the_now.name} - #{the_now.price} - #{the_now.availability}".yellow
      elsif input == "list"
        list_buy
      else
      goodbye
      end
    end
  end
end
