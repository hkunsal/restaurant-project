class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def display
    @dishes.map do |dish|
      "#{dish.name}: $#{dish.price}"
    end.join("\n") + "\n"
  end
end