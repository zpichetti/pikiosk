Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :boards, only: [:index, :create, :new, :edit, :update] do
    resources :articles
    resources :calendars
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/boards/:link', to: 'boards#show'
  
end
