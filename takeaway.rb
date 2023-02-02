require 'twilio-ruby'
require 'json'


class Takeaway
    
    def initialize
      @order = []
      @menu = {
          "Pizza Margherita" => 8.99,
          "Spaghetti Bolognese" => 9.99,
          "Fried Rice" => 7.99,
          "Vegetable Curry" => 10.99,
          "Chicken Tikka Masala" => 12.99,
          "Beef Burger" => 7.99,
          "Fish and Chips" => 11.99,
          "Pad Thai" => 10.99,
          "Falafel Wrap" => 8.99,
          "Shawarma" => 9.99
          }
    end
    
    def welcome
      menu_items = @menu.map { |item, price| "#{item} - #{price}" }.join("\n")
      puts "I am Karen. Order and get out!. Tell me your name?!."
      name = gets.chomp()
      puts "Welcome to Karens, #{name.downcase.capitalize}. Look at our menu quickly and stop wasting my time: \n#{menu_items}"
    end
    
    def add(item)
      puts "We do not have that item on the menu! Did you never learn how to read, Doofus!" if @menu.include?(item) == false
      @order << item if @menu.include?(item) 
    
    end
    
    def remove(item)
     puts "The item is not in your order dimwit. Are you suffering from memory loss?" if @order.include?(item) == false
      @order.delete(item) if @order.include?(item)
    end
    
    def confirm
      answer = ""
      while answer != "yes"
        puts "Your order is:\n#{@order.join("\n")}. \nHappy with the order? Type yes.\nWant an item removed? Type the item you want removed you stingy person."
        answer = gets.chomp()
        break if answer == "yes"
        remove(answer)
      end
    end
    
    def text
      puts "What is your number? Relax, I have no interest in you, you're ugly. +44"
      @mobile_number = gets.chomp()
      output = %x(aws ssm get-parameter --name Twilio_Token)
      token = JSON.parse(output)["Parameter"]["Value"]
      output = %x(aws ssm get-parameter --name Twilio_SID)
      sid = JSON.parse(output)["Parameter"]["Value"]
      
      account_sid = sid
      auth_token = token  
      @client = Twilio::REST::Client.new account_sid, auth_token
      @client.messages.create(
      body: "Your order is:\n#{@order.join("\n")}.\nIt will arrive at latest by #{(Time.now + 30 * 60).strftime("%I:%M %p")}.",
      to: "+44#{@mobile_number}",    
      from: "+19402908459")  

    end
    
    def second_text
      sleep 900
      output = %x(aws ssm get-parameter --name Twilio_Token)
      token = JSON.parse(output)["Parameter"]["Value"]
      output = %x(aws ssm get-parameter --name Twilio_SID)
      sid = JSON.parse(output)["Parameter"]["Value"]
      
      account_sid = sid
      auth_token = token  
      @client = Twilio::REST::Client.new account_sid, auth_token
      @client.messages.create(
      body: "Your order will arive in fifteen minutes.",
      to: "+44#{@mobile_number}",    
      from: "+19402908459")  
    end
    
    def order
      puts "Tell me, what do you want, and keep your weight in mind."
      item = gets.chomp()
      add(item)
      while true
        puts "What else do you want fatty, or are you done?"
        item = gets.chomp() 
        break if item == "yes"
        add(item)
      end
    end
    
    
    
    def process
      welcome
      order
      confirm
      text
      second_text
    end
      

end

order = Takeaway.new()
order.process()

