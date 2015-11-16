Rails.application.routes.draw do
  root 'matches#index'

  get 'matches', to: 'matches#index'
  # get 'matches/:id', to: 'matches#show'

  get '/about', to: redirect('/wtf'), as: 'about_redirect'
  get '/wtf', to: 'pages#about', as: 'about'

  namespace :admin do
    resources :matches, only: [:new, :create, :edit, :update] do
      resources :goals, only: [:new, :create, :edit, :update]
    end
  end
end
