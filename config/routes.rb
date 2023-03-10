Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'recipes#index'

  resources :foods
  get 'general_shopping_list', to: 'shoppings#index', as: 'shoppings'
  get 'public_recipes', to: 'public_recipes#index', as: 'public_recipes'

  # resources :shoppings
  resources :recipes, only: [:index, :new, :create]
  # get 'recipes/new'
  # post 'recipes/create'
  get 'recipes/destroy/:id', to: 'recipes#destroy', as: 'delete_recipe'
  get 'recipes/detail'
  get 'recipes/add_ingredient/:id', to: "recipes#add_ingredient", as: "recipe_add_ingredient"
  post 'recipes/create_ingredient/:id', to: "recipes#create_ingredient", as: "recipe_create_ingredient"
end
