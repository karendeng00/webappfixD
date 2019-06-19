Rails.application.routes.draw do
  root 'issues#index'

  get 'about' => 'pages#about'

  resources :issues

end
