Rails.application.routes.draw do

  get 'session/new', to: 'session#new'
  post 'session/new', to: 'session#create'
  delete 'session/logout', to: 'session#destroy'

  get 'user/new', to: 'user#new'
  post 'user/new', to: 'user#create'

  get 'user/show', to: 'user#show'

  get 'time_spent/new', to: 'time_spent#new'
  post 'time_spent/new', to: 'time_spent#create'

  get 'time_spent/show', to: 'time_spent#show'
  get 'time_spent/plan_check', to: 'time_spent#show2'

  get 'group/show', to: 'group#show'
  
  root "session#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
