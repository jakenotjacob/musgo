class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      flash[:notice] = "Ingredient has been created."
      redirect_to @ingredient
    else
      flash.now[:alert] ="Ingredient has not been created."
      render "new"
    end
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :description)
  end
end
