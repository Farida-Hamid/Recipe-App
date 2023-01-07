class FoodsController < ApplicationController
  def index
    @foods = Food.where(user: current_user)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)

    @food.user_id = current_user.id

    if @food.save
      redirect_to foods_path
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(food_params)

    @food.user_id = current_user.id

    if @food.save
      redirect_to foods_path
    else
      render :new
    end
  end

  private

  def food_params
    params.require(:new_food).permit(:quantity, :name, :price, :measurement_unit)
  end
end
