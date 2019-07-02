module Types
  class MutationType < Types::BaseObject
    ## Users
    field :create_user, mutation: Mutations::Users::CreateUser

    ## Issues

    ## Comments
    field :create_comment, mutation: Mutations::Comments::CreateComment
    field :edit_comment, mutation: Mutations::Comments::EditComment
  end
end
