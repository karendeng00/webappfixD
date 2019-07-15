Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end


  ## Main routes

  post "/graphql", to: "graphql#execute"
  
  root 'pages#welcome'

  get 'about' => 'pages#about'

  ## Issue routes

  ## OIT routes
  get 'newOIT/:id' => 'issues#newOIT', as: 'new_oit'
  post 'updateIssue/:id', to: 'issues#updateIssue', as: 'update_oit'

  ## EAM routes
  get 'newFMD/:id' => 'issues#newFMD', as: 'new_fmd'
  post 'updateIssue/:id', to: 'issues#updateIssue', as: 'update_fmd'

  ## PT routes
  get 'newPT/:id' => 'issues#newPT', as: 'new_pt'
  post 'updateIssue/:id', to: 'issues#updateIssue', as: 'update_pt'

  ## HRL routes
  get 'newHRL/:id' => 'issues#newHRL', as: 'new_hrl'
  post 'updateIssue/:id', to: 'issues#updateIssue', as: 'update_hrl'

  get 'issues' => 'issues#index'

  get 'json' => 'issues#json'

  post 'json/:id' => 'issues#jsonByIssue'

  post 'createIssueMobile' => 'issues#createIssueMobile'

  #post 'createNewOIT' => 'issues#newOIT', :as => :newOIT

  post 'setpath' => 'issues#setPath', :as => :setPath



  resources :issues

  ## Routes for Users
  
  get 'users' => 'users#index'

  resources :users

  ## Routes for Comments

  resources :comments

  # get 'comments' => 'comments#index'

end
