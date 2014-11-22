
Comparify::Application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  root "pages#home"

  get 'autocomplete_topic_tags', to: "topics#autocomplete_tag"
  resources :topics, only: [:index, :new, :create, :show] do
    resources :answers, only: [:create, :new]
  end

  resources :answers do
    resources :comments, shallow: true
  end
  resources :comments, only: [:show, :edit, :update, :destroy]

  resources :users
  resources :relationships
end
