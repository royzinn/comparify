
Comparify::Application.routes.draw do
  devise_for :users
  root "pages#home"

  get 'autocomplete_topic_tags', to: "topics#autocomplete_tag"
  resources :topics, only: [:index, :new, :create, :show] do
    resources :answers, only: [:create, :new]
  end

  resources :users
  resources :relationships
end
