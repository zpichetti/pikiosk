Rails.application.routes.draw do
  get 'calendars/index'
  get 'calendars/new'
  get 'calendars/show'
  get 'articles/index'
  get 'articles/new'
  get 'articles/show'
  devise_for :users
  root to: 'pages#home'
  resources :boards, only: [:index, :create, :new] do
    resources :articles
    resources :calendars
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/boards/:link', to: 'boards#show', as: 'board'
  
end
