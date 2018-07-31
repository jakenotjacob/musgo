class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def show
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

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      flash[:notice] = "Ingredient has been updated."
      redirect_to @ingredient
    else
      flash.now[:alert] = "Ingredient has not been updated."
      render "edit"
    end
  end

  def destroy
    @ingredient.destroy

    flash[:notice] = "Ingredient has been deleted."
    redirect_to ingredients_path
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The ingredient you were looking for could not be found."
    redirect_to ingredients_path
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :description)
  end
end
