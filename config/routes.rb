Rails.application.routes.draw do
  resources :items_entertainers
  resources :items_lives
  resources :items_news
  resources :items_animegames
  resources :items_sports
  resources :items_socialgames
  resources :items_its
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
