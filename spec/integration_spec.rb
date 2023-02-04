require "dish"
require "menu"
require "order"
require "twilio-ruby"
require "dotenv"
Dotenv.load


RSpec.describe "integration" do
  it "adds dish to the menu and displays them" do
    menu = Menu.new
    menu.add_dish(Dish.new("Salad", 12))
    menu.add_dish(Dish.new("Pasta", 15))
    menu.add_dish(Dish.new("Pizza", 18))
    expect(menu.display).to eq ("Salad: $12\nPasta: $15\nPizza: $18\n")
  end

  it "displays an itemized receipt with a grand total" do
    menu = Menu.new
    menu.add_dish(Dish.new("Salad", 12))
    menu.add_dish(Dish.new("Pasta", 15))
    menu.add_dish(Dish.new("Pizza", 18))
    order = Order.new
    order.add_dish(menu.dishes[0])
    order.add_dish(menu.dishes[2])
    expect(order.itemized_receipt).to eq("Itemized Receipt\nSalad: $12\nPizza: $18\nTotal: $30\n")
  end
end