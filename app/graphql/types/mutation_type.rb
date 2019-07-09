module Types
  class MutationType < Types::BaseObject
    ## Users
    field :create_user, mutation: Mutations::Users::CreateUser

    ## Issues
    field :create_issue, mutation: Mutations::Issues::CreateIssue
    field :edit_issue, mutation: Mutations::Issues::EditIssue
    field :delete_issue, mutation: Mutations::Issues::DeleteIssue

    ## Comments
    field :create_comment, mutation: Mutations::Comments::CreateComment
    field :edit_comment, mutation: Mutations::Comments::EditComment
    field :delete_comment, mutation: Mutations::Comments::DeleteComment
  end
end
 