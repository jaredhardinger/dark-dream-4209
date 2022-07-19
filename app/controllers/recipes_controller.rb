class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    recipe = Recipe.find(params[:id])
    @name = recipe.name
    @ingredients = recipe.ingredients
  end
end
