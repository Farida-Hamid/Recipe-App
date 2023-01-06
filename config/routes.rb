Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  get 'recipe/index'
  get 'recipe/new'
  post 'recipe/create'
  get 'recipe/destroy/:id', to: 'recipe#destroy', as: 'delete_recipe'
  get 'recipe/detail'
  get 'recipe/add_ingredient/:id', to: "recipe#add_ingredient", as: "recipe_add_ingredient"
  post 'recipe/create_ingredient/:id', to: "recipe#create_ingredient", as: "recipe_create_ingredient"
end
