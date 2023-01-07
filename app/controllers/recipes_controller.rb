class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def detail
    @recipe = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.where(recipe_id: params[:id]).includes(:food)
    @reload_id = current_user.id
  end

  def show
    @recipes = Recipe.where(user_id: params[:user_id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    @recipe.user_id = current_user.id

    if @recipe.save
      redirect_to recipes_path
    else

      render :new
    end
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy if @recipe.user == current_user
    redirect_to recipes_path
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
