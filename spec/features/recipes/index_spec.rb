require 'rails_helper'

RSpec.describe 'Recipes Index Page' do
  it 'has a list of recipes with name, complexity, and genre' do
    recipe_1 = Recipe.create!(name: 'Pizza', complexity: 4, genre: 'Italian')
    recipe_2 = Recipe.create!(name: 'Coleslaw', complexity: 1, genre: 'What do I do with Cabbage')
    recipe_3 = Recipe.create!(name: 'Cookies', complexity: 2, genre: 'Dessert')

    visit "/recipes"

    expect(page).to have_content(recipe_1.name)
    expect(page).to have_content(recipe_1.complexity)
    expect(page).to have_content(recipe_1.genre)

    expect(page).to have_content(recipe_2.name)
    expect(page).to have_content(recipe_2.complexity)
    expect(page).to have_content(recipe_2.genre)

    expect(page).to have_content(recipe_3.name)
    expect(page).to have_content(recipe_3.complexity)
    expect(page).to have_content(recipe_3.genre)
  end
end
