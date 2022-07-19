require 'rails_helper'
# As a visitor,
# When I visit '/recipes/:id'
# I see a list of the names of the ingredients the recipe has.
# (e.g. "Pasta, Meat, Cheese")
RSpec.describe 'Recipes Show Page' do
  it 'has a list of ingredients the recipe has' do
    recipe_1 = Recipe.create!(name: 'Pizza', complexity: '4', genre: 'Italian')
    dough = Ingredient.create!(name: 'dough', cost: '1')
    cheese = Ingredient.create!(name: 'cheese', cost: '3')
    sauce = Ingredient.create!(name: 'sauce', cost: '2')

    visit "/recipes/#{recipe_1.id}"

    expect(page).to have_content(dough.name)
    expect(page).to have_content(cheese.name)
    expect(page).to have_content(sauce.name)
  end
end
