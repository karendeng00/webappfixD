Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end


  ## Main routes

  post "/graphql", to: "graphql#execute"
  
  root 'pages#welcome'

  get 'about' => 'pages#about'

  get 'issues' => 'issues#index'

  get 'json' => 'issues#json'

  post 'createIssueMobile' => 'issues#createIssueMobile'

  resources :issues

  ## Routes for Users
  
  get 'users' => 'users#index'

  resources :users

end
