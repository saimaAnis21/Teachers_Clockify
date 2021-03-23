Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy], controller: 'session'
  resource :user, only: [:new, :create, :show], controller: 'user'
  resource :group, only: [:new, :create, :show], controller: 'group' do
    member do
      get :teach
    end
  end

  resource :time_spent, only: [:new, :create, :show], controller: 'time_spent' 
  # do
   
  #   resources :plan_check, only: [:new, :create, :show]
      
  # end
   
  # get 'time_spent/new', to: 'time_spent#new'
  # post 'time_spent/new', to: 'time_spent#create'

  get 'time_spent/plan_check_new', to: 'time_spent#new2'
  post 'time_spent/plan_check_new', to: 'time_spent#create2'

  # get 'time_spent/show', to: 'time_spent#show'
  get 'time_spent/plan_check', to: 'time_spent#show2'
  

 
  
  root "session#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
