require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe 'instance methods' do
    it 'returns the sum of the cost of ingredients' do
      recipe_1 = Recipe.create!(name: 'Pizza', complexity: 4, genre: 'Italian')
      dough = Ingredient.create!(name: 'Dough', cost: 1)
      cheese = Ingredient.create!(name: 'Cheese', cost: 3)
      sauce = Ingredient.create!(name: 'Sauce', cost: 2)
      RecipeIngredient.create!(recipe: recipe_1, ingredient: dough)
      RecipeIngredient.create!(recipe: recipe_1, ingredient: cheese)
      RecipeIngredient.create!(recipe: recipe_1, ingredient: sauce)

      expect(recipe_1.cost).to eq(6)
    end
  end
end
