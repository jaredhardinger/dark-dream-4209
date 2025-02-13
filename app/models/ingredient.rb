class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :cost, presence: true

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def included_in
    recipes.count
  end
end
