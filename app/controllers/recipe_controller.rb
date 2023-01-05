class RecipeController < ApplicationController
  def index
    @recipes = Recipe.where(owner_id: current_user.id)
  end

  def detail
    @recipe = Recipe.find_by(id: params[:id])
    # @recipe_food = RecipeFood.all
    @recipe_food = Food.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    @recipe.owner_id = current_user.id

    if @recipe.save
      redirect_to recipe_index_path
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy if (@recipe.owner_id = current_user.id)
    redirect_to recipe_index_path
  end

  private

  def recipe_params
    params.require(:new_recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
