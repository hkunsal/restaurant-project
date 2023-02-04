# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

> As a customer  
> So that I can check if I want to order something  
> I would like to see a list of dishes with prices.
> 
> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes.
> 
> As a customer  
> So that I can verify that my order is correct  
> I would like to see an itemised receipt with a grand total.

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌────────────────────────────┐
│ Menu                       │
│ --------                   │                     
│  - list(dish, price)       │
│  - order                   │                
│                            │
│                            │
└───────────┬────────────────┘
            │
            │ TaskList has zero or 
            | more Tasks
            ▼
┌─────────────────────────┐
│ Meal                    │
│ --------                │
│ - select(dish)          │
│                         │
│                         │
└─────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby

class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def display
    @dishes.each do |dish|
      puts "#{dish.name}: $#{dish.price}"
    end
  end
end

class Order
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def itemized_receipt
    total = 0
    puts "Itemized Receipt"
    @dishes.each do |dish|
      puts "#{dish.name}: $#{dish.price}"
      total += dish.price
    end
    puts "Total: $#{total}"
  end
end

# Example usage

menu = Menu.new

menu.add_dish(Dish.new("Pizza", 15))
menu.add_dish(Dish.new("Pasta", 12))
menu.add_dish(Dish.new("Salad", 10))

menu.display
# Pizza: $15
# Pasta: $12
# Salad: $10

order = Order.new

order.add_dish(menu.dishes[0])
order.add_dish(menu.dishes[2])

order.itemized_receipt
# Itemized Receipt
# Pizza: $15
# Salad: $10
# Total: $25


```

## 3. Create Examples as Integration Tests


```ruby
# EXAMPLE

menu = Menu.new

menu.add_dish(Dish.new("Pizza", 15))
menu.add_dish(Dish.new("Pasta", 12))
menu.add_dish(Dish.new("Salad", 10))

menu.display
# Pizza: $15
# Pasta: $12
# Salad: $10

order = Order.new

order.add_dish(menu.dishes[0])
order.add_dish(menu.dishes[2])

order.itemized_receipt
# Itemized Receipt
# Pizza: $15
# Salad: $10
# Total: $25
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE
#TaskList
#1

task_list = TaskList.new
task_list.all # => []

#2

task_list = TaskList.new
task_list.complete? # => []

#Task

#1

task = Task.new("walk the dog")
task.title # => "walk the dog"

#2

task = Task.new("walk the dog")
task.complete? # => false

#3

task = Task.new("walk the dog")
task.mark_complete
task.complete? # => true

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->