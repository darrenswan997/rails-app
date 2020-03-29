Rails.application.routes.draw do
  
  root to: 'pages#home'

  resources :links do
    resources :comments
  end

  get 'articles', to:"links#news"
  
  get 'search', to: "links#search"
  get 'links', to: "links#index"
 
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
