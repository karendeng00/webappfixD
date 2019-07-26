module Types
  class MutationType < Types::BaseObject
    ## Users
    field :create_user, mutation: Mutations::Users::CreateUser
    field :add_like_to_user, mutation: Mutations::Users::AddLikeToUser
    field :add_fav_to_user, mutation: Mutations::Users::AddFavToUser
    field :delete_like_from_user, mutation: Mutations::Users::DeleteLikeFromUser
    field :delete_fav_from_user, mutation: Mutations::Users::DeleteFavFromUser

    ## Issues
    field :create_issue, mutation: Mutations::Issues::CreateIssue
    field :edit_issue, mutation: Mutations::Issues::EditIssue
    field :delete_issue, mutation: Mutations::Issues::DeleteIssue
    field :add_like_to_issue, mutation: Mutations::Issues::AddLikeToIssue
    field :add_favorite_to_issue, mutation: Mutations::Issues::AddFavoriteToIssue
    field :delete_like_from_issue, mutation: Mutations::Issues::DeleteLikeFromIssue
    field :delete_favorite_from_issue, mutation: Mutations::Issues::DeleteFavoriteFromIssue

    ## Comments
    field :create_comment, mutation: Mutations::Comments::CreateComment
    field :edit_comment, mutation: Mutations::Comments::EditComment
    field :delete_comment, mutation: Mutations::Comments::DeleteComment
  end
end
 