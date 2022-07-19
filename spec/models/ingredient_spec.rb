require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe 'instance methods' do
    it 'returns the number of recipes an ingredient is included in' do
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

      expect(dough.included_in).to eq(2)
      expect(cheese.included_in).to eq(1)
      expect(sauce.included_in).to eq(1)
      expect(choco_chips.included_in).to eq(1)
    end
  end
end
