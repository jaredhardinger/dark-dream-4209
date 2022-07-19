require 'rails_helper'

RSpec.describe 'Recipes Show Page' do
  it 'has a list of ingredients the recipe has' do
    recipe_1 = Recipe.create!(name: 'Pizza', complexity: '4', genre: 'Italian')
    dough = Ingredient.create!(name: 'Dough', cost: '1')
    cheese = Ingredient.create!(name: 'Cheese', cost: '3')
    sauce = Ingredient.create!(name: 'Sauce', cost: '2')
    RecipeIngredient.create!(recipe: recipe_1, ingredient: dough)
    RecipeIngredient.create!(recipe: recipe_1, ingredient: cheese)
    RecipeIngredient.create!(recipe: recipe_1, ingredient: sauce)

    visit "/recipes/#{recipe_1.id}"

    expect(page).to have_content(dough.name)
    expect(page).to have_content(cheese.name)
    expect(page).to have_content(sauce.name)
  end

  it 'shows the total cost of all the ingredients in the recipe' do
    recipe_1 = Recipe.create!(name: 'Pizza', complexity: '4', genre: 'Italian')
    dough = Ingredient.create!(name: 'Dough', cost: '1')
    cheese = Ingredient.create!(name: 'Cheese', cost: '3')
    sauce = Ingredient.create!(name: 'Sauce', cost: '2')
    RecipeIngredient.create!(recipe: recipe_1, ingredient: dough)
    RecipeIngredient.create!(recipe: recipe_1, ingredient: cheese)
    RecipeIngredient.create!(recipe: recipe_1, ingredient: sauce)

    visit "/recipes/#{recipe_1.id}"

    expect(page).to have_content("Total Cost: 6")
  end
end
