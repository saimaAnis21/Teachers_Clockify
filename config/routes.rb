Rails.application.routes.draw do
  get 'session/new', to: 'session#new'
  post 'session/new', to: 'session#create'
  delete 'session/logout', to: 'session#destroy'

  get 'user/new', to: 'user#new'
  post 'user/new', to: 'user#create'

  get 'user/show', to: 'user#show'

  root "session#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
