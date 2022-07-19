require 'rails_helper'

RSpec.describe 'Ingredients Index Page' do
  it 'has a list of ingredients and the number of recipes each ingredient is in' do
    pizza = Recipe.create!(name: 'Pizza', complexity: 4, genre: 'Italian')
    dough = Ingredient.create!(name: 'Dough', cost: 1)
    cheese = Ingredient.create!(name: 'Cheese', cost: 3)
    sauce = Ingredient.create!(name: 'Sauce', cost: 2)
    RecipeIngredient.create!(recipe: pizza, ingredient: dough)
    RecipeIngredient.create!(recipe: pizza, ingredient: cheese)
    RecipeIngredient.create!(recipe: pizza, ingredient: sauce)

    cookies = Recipe.create!(name: 'Cookies', complexity: 2, genre: 'Desserts')
    choco_chips = Ingredient.create!(name: 'Chocolate Chips', cost: 1)
    RecipeIngredient.create!(recipe: cookies, ingredient: dough)
    RecipeIngredient.create!(recipe: cookies, ingredient: choco_chips)

    visit "/ingredients"

    expect(page).to have_content("#{dough.name}: 2")
    expect(page).to have_content("#{cheese.name}: 1")
    expect(page).to have_content("#{sauce.name}: 1")
    expect(page).to have_content("#{choco_chips.name}: 1")
  end
end
