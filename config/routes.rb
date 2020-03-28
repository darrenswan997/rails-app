Rails.application.routes.draw do
  get 'comments/create'
  resources :links
  root to: 'pages#home'
  get '/search', to: "links#search"
  get 'links', to: "links#index"
  get '/articles', to: "links#article"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
