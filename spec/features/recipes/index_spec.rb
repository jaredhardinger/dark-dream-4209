require 'rails_helper'

RSpec.describe 'Recipes Index Page' do
  before :each do
    recipe_1 = Recipe.create!(name: 'Pizza', complexity: '4', genre: 'Italian')
    recipe_2 = Recipe.create!(name: 'Coleslaw', complexity: '1', genre: 'What do I do with Cabbage')
    recipe_2 = Recipe.create!(name: 'Cookies', complexity: '2', genre: 'Dessert')
    visit "/recipes"
  end
  #   As a visitor,
  # When I visit '/recipes',
  # I see a list of recipes with the following information:
  # -Name
  # -Complexity
  # -Genre
  # (e.g. "Name: Spaghetti, Complexity: 2, Genre: Italian")
  it 'has a list of recipes with name, complexity, and genre' do
    expect(page).to have_content(recipe_1.name)
    expect(page).to have_content(recipe_1.complexity)
    expect(page).to have_content(recipe_1.genre)

    expect(page).to have_content(recipe_2.name)
    expect(page).to have_content(recipe_2.complexity)
    expect(page).to have_content(recipe_2.genre)  
  end
end
