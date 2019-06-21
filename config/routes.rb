Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"
  
  root 'issues#index'

  get 'about' => 'pages#about'

  get 'index' => 'issues#index'

  get 'json' => 'issues#json'

  post 'createIssueMobile' => 'issues#createIssueMobile'

  resources :issues

end
