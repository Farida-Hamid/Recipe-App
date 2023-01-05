class RecipeController < ApplicationController
  def index
    @recipes = Recipe.where(owner_id: User.first.id)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    @recipe.owner_id = User.first.id

    if @recipe.save
      redirect_to recipe_index_path
    else
      render :new
    end
  end

  def destroy
    Recipe.find_by(id: params[:id]).destroy
    redirect_to recipe_index_path
  end

  private

  def recipe_params
    params.require(:new_recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
