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
  # resources :dining_issues, controller: 'issues', type: 'DiningIssue' 
  # resources :eam_issues, controller: 'issues', type: 'EamIssue' 
  # resources :hrl_issues, controller: 'issues', type: 'HrlIssue'
  # resources :pt_issues, controller: 'issues', type: 'PtIssue'
  # resources :sn_issues, controller: 'issues', type: 'SnIssue' 

  ## Routes for Users
  
  get 'users' => 'users#index'

  resources :users

  ## Routes for Comments

  resources :comments

  # get 'comments' => 'comments#index'

end
