class Order
  attr_reader :dishes
  attr_reader :time_placed

  def initialize
    @dishes = []
    @time_placed = Time.now
  end

  def add_dish(dish)
    @dishes << dish
  end

  def itemized_receipt
    total = 0
    itemized_receipt = "Itemized Receipt\n"
    @dishes.each do |dish|
      itemized_receipt += "#{dish.name}: $#{dish.price}\n"
      total += dish.price
    end
    itemized_receipt += "Total: $#{total}\n"
    itemized_receipt
  end

  def delivery_text
    "Thank you! Your order was placed and will be delivered before #{(@time_placed + 60 * 60).strftime("%H:%M")}"
  end
end