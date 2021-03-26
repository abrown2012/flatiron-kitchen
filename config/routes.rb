Rails.application.routes.draw do

    resources :recipes, :ingredients, :recipe_ingredients
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
end
