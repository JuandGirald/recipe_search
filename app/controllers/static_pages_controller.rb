class StaticPagesController < ApplicationController
  # include RecipeApiMethods

  def home
    if params[:query]
      @recipes = RecipeMethods::Api.new(params[:query], 1).response || []
    else
      @recipes = []
    end
  end
end
