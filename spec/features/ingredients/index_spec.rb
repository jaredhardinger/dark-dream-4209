require 'rails_helper'

RSpec.describe 'Ingredients Index Page' do
  it 'has a list of ingredients and the number of recipes each ingredient is in' do
    pizza = Recipe.create!(name: 'Pizza', complexity: '4', genre: 'Italian')
    dough = Ingredient.create!(name: 'Dough', cost: '1')
    cheese = Ingredient.create!(name: 'Cheese', cost: '3')
    sauce = Ingredient.create!(name: 'Sauce', cost: '2')
    RecipeIngredient.create!(recipe: pizza, ingredient: dough)
    RecipeIngredient.create!(recipe: pizza, ingredient: cheese)
    RecipeIngredient.create!(recipe: pizza, ingredient: sauce)

    cookies = Recipe.create!(name: 'Cookies', complexity: '2', genre: 'Desserts')
    choco_chips = Ingredient.create!(name: 'Chocolate Chips', cost: '1')
    RecipeIngredient.create!(recipe: cookies, ingredient: dough)
    RecipeIngredient.create!(recipe: cookies, ingredient: choco_chips)

    visit "/ingredients"

    within "#dough" do
      expect(page).to have_content(dough.name)
      expect(page).to have_content("Included in 2 recipe(s)")
    end

    within "#cheese" do
      expect(page).to have_content(cheese.name)
      expect(page).to have_content("Included in 1 recipe(s)")
    end

    within "#sauce" do
      expect(page).to have_content(sauce.name)
      expect(page).to have_content("Included in 1 recipe(s)")
    end

    within "#choco_chips" do
      expect(page).to have_content(choco_chips.name)
      expect(page).to have_content("Included in 1 recipe(s)")
    end
  end
end
