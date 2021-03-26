class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  
    # GET /posts
    # GET /posts.json
    def index
      @recipes = Recipe.all
    end
  
    # GET /posts/1
    # GET /posts/1.json
    def show
    end
  
    # GET /posts/new
    def new
      @recipe = Recipe.new
    end
  
    # GET /posts/1/edit
    def edit
    end
  
    # POST /posts
    # POST /posts.json
    def create
      # binding.pry
      recipe = Recipe.create(recipe_params)
      
      if !params[:recipe][:ingredient_ids].first.empty?
        new_ingredient = Ingredient.create(name: params[:recipe][:ingredient_ids].first)
        recipe.ingredients << new_ingredient 
      end 
      
      redirect_to recipe 
      
    end
  
    # PATCH/PUT /posts/1
    # PATCH/PUT /posts/1.json
    def update
      respond_to do |format|
        if @recipe.update(recipe_params)
          format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @recipe.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /posts/1
    # DELETE /posts/1.json
    def destroy
      @recipe.destroy
      respond_to do |format|
        format.html { redirect_to posts_url }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_recipe
        @recipe = Recipe.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids:[], ingredient_attributes: [:name])
      end
  end