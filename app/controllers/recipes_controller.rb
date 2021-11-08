# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  # before_action :authenticate_user!, only: %i[create destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.includes(:user).order(id: :desc).all
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.js {}
      else
        format.js { render js: "alert(\"#{@recipe.errors.full_messages.join(',')}.\");" }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:dish, :description).merge(user: current_user)
    end
end
