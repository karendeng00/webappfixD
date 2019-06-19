Rails.application.routes.draw do
  root 'issues#index'

  get 'about' => 'pages#about'

  get 'index' => 'issues#index'

  resources :issues

end
