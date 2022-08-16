class Potluck 
  attr_reader :date,
              :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    dish_by_category = []
    @dishes.each do |dish|
      if dish.category == category
        dish_by_category << dish
      end
    end
    dish_by_category
  end
  
  def menu 
    categories = dishes.map do |dish|
      dish.category 
    end.uniq
    menu_hash = {}
    categories.each do |cat|
      category_to_string = cat.to_s + "s"
      dish_names = get_all_from_category(cat).map do |dish|
        dish.name
      end
      menu_hash[category_to_string.to_sym] = dish_names.sort
    end
    menu_hash
  end
  
  def ratio(category)
   (get_all_from_category(category).length / dishes.count.to_f * 100 ).round(1)
  end
end





 