Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/search', controller: "myhome", action: "search"
  
  resources :mygems do
    resources :previews
  end

  resources :categories
  get '/my_activity', controller: "myhome", action: "activity"

  root :to => 'myhome#index'
  # root :to => 'mygems#index'
end
