Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy], controller: 'session'
  resource :user, only: [:new, :create, :show], controller: 'user'
  resource :group, only: [:new, :create, :show], controller: 'group' do
    member do
      get :teach
    end
  end

  resource :time_spent, only: [:new, :create, :show], controller: 'time_spent' do
    member do
      get :plancheckshow
      get :planchecknew
    end
  end
  
  root "session#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
