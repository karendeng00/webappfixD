module Types
  class MutationType < BaseObject
   
    field :create_user, mutation: Mutations::User::CreateUser
  end
end
