require './lib/potluck'
require './lib/dish'
require 'pry'

RSpec.describe 'Potluck' do 

  let(:potluck) { Potluck.new("7-13-18") }
  let(:couscous_salad) { Dish.new("Couscous Salad", :appetizer) }
  let(:cocktail_meatballs) { Dish.new("Cocktail Meatballs", :entre) }
  let(:summer_pizza) { Dish.new("Summer Pizza", :appetizer) }
  let(:roast_pork) { Dish.new("Roast Pork", :entre) }
  let(:candy_salad) { Dish.new("Candy Salad", :dessert) }
  let(:bean_dip) { Dish.new("Bean Dip", :appetizer) }

  it "exists" do
    expect(potluck).to be_a(Potluck)   
  end

  it "hast attributes" do 
    expect(potluck.date).to eq("7-13-18")
  end

  it "can have dishes" do 
    expect(potluck.dishes).to eq([])
  end
  
  it "can add dishes" do 
    potluck.add_dish(couscous_salad)
    potluck.add_dish(cocktail_meatballs)

    expect(potluck.dishes).to eq([couscous_salad, cocktail_meatballs])
    expect(potluck.dishes.length).to eq(2)
  end

  it "can get all the dishes from a given category" do 

    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)

    expect(potluck.get_all_from_category(:appetizer)).to eq([couscous_salad, summer_pizza])
    expect(potluck.get_all_from_category(:appetizer).first).to eq(couscous_salad)
    expect(potluck.get_all_from_category(:appetizer).first.name).to eq("Couscous Salad")
  end

  it "can return a menu of dishes sorted by alphabetical order" do 
    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)
    potluck.add_dish(bean_dip)

    expected = {
                :appetizers=>["Bean Dip", "Couscous Salad", "Summer Pizza"],
                :entres=>["Cocktail Meatballs", "Roast Pork"],
                :desserts=>["Candy Salad"]
              }
    expect(potluck.menu).to eq(expected)
  end

  it "can return a ratio" do 
    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)
    potluck.add_dish(bean_dip)

    expect(potluck.ratio(:appetizer)).to eq(50.0)
    expect(potluck.ratio(:dessert)).to eq(16.7)
  end
end