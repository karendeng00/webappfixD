Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end


  ## Main routes

  post "/graphql", to: "graphql#execute"
  
  root 'pages#welcome'

  get 'about' => 'pages#about'

  ## Issue routes

  get 'issues' => 'issues#index'

  get 'json' => 'issues#json'

  post 'createIssueMobile' => 'issues#createIssueMobile'

  post 'createNewOIT' => 'issues#newOIT', :as => :newOIT

  post 'setpath' => 'issues#setPath', :as => :setPath



  resources :issues

  

  ## Routes for Users
  
  get 'users' => 'users#index'

  resources :users

  ## Routes for Comments

  resources :comments

  # get 'comments' => 'comments#index'

end
