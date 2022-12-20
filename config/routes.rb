Rails.application.routes.draw do
  #get 'recipe_foods/index'
  #get 'recipes/index'
  #get 'inventory_foods/index'
  get 'inventories/index'
  #get 'inventories/show'
  #get 'foods/index'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/public_recipes', to: 'recipes#public'


  resources :recipes do
    resources :recipe_foods
  end

  resources :inventories, only: [:index, :show, :new, :create, :destroy] do
    resources :inventory_foods, only: [:index, :show, :new, :create, :destroy]
  end

  root to: "foods#index"

  resources :foods
  resources :recipes do
    resources :shopping_lists
    resources :recipe_foods
  end

  resources :shopping_lists
end


  # Defines the root path route ("/")
  # root "articles#index"

