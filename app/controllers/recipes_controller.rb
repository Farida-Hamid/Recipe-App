class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(owner_id: current_user.id)
  end

  def detail
    @recipe = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.where(recipe_id: params[:id]).includes(:foods)
    @reload_id = current_user.id
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

  def add_ingredient
    @foods = Food.all.map { |food| [food.name, food.id] }
    @recipe_id = params[:id]
    @recipe_food = RecipeFood.new
  end

  def create_ingredient
    @ingredient = RecipeFood.new(quantity: ingredient_params[:quantity], recipe_id: params[:id],
                                 food_id: ingredient_params[:food])

    if @ingredient.save
      redirect_to recipe_detail_path(id: params[:id])
    else
      render :new, alert: 'Something went wrong!'
    end
  end

  private

  def ingredient_params
    params.require(:new_recipe_food).permit(:quantity, :food)
  end

  def recipe_params
    params.require(:new_recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
