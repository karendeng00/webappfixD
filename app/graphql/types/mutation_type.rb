module Types
  class MutationType < Types::BaseObject
    ## Users
    field :create_user, mutation: Mutations::Users::CreateUser

    ## Issues
    field :create_issue, mutation: Mutations::Issues::CreateIssue
    #field :edit_issue, mutation: Mutations::Issues::EditIssue

    ## Comments
    field :create_comment, mutation: Mutations::Comments::CreateComment
  end
end
