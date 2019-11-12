Rails.application.routes.draw do
  get 'welcome/home'
  get 'welcome/about'
  resources :articles
  root 'welcome#home'

  get 'signup', to: 'users#new'
  resources :users  #, except: [:new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
