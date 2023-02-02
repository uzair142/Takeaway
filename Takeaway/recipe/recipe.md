# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

'''ruby

#...Method showing all the prices of items on the menu
#...Method to select an item
#...Method to show an itemised receipt


class Takeaway_admin

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
  puts 'It's a pleasure to meet you. I am Blobby. What is your name?
  name = gets.chomp
  puts 'Welcome to the Land of Halal. This is our menu #{@menu}'
end


def customer
    welcome
        puts 'Please type the item that you'd like to order.If you are done ordering please type cancel'
        item = gets.chomp
        index = menu.scan(#{item}).index()
        order(@order[index])
    confirm
  
def order(item)
    @item = item
    @order << @item
end

def confirm
  puts the order
  'if you are happy, type yes'
  else type the item you want removed
  #...If item is in the order, return that it is removed, else ask the question again

end

def remove(item)
    @order >> item
end
    

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1
reminder = Reminder("Kay")
reminder.remind_me_to("Walk the dog")
reminder.remind() # => "Walk the dog, Kay!"

# 2
reminder = Reminder("Kay")
reminder.remind() # fails with "No task set."

# 3
reminder = Reminder("Kay")
reminder.remind_me_to("")
reminder.remind() # => ", Kay!"
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._


