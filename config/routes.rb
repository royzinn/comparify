Comparify::Application.routes.draw do
  devise_for :users
  root "pages#home"

  resources :topics, only: [:index, :new, :create, :show]
end
