Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/like/:board_id', to: 'likes#like', as: 'like'
  delete '/like/:board_id', to: 'likes#unlike', as: 'unlike'

  root 'home#index'
  resources :users do 
    get :search, on: :collection
  end
  resources :boards
  resources :comments, only: %i[create destroy]
  resources :categories, only: %i[index new create destroy]
end
