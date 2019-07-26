module Mutations
    module Users
        class DeleteLikeFromUser < BaseMutation

            argument :user_id, Int, required: true
            argument :issue_id, Int, required: true

            type Types::UserType

            def resolve(user_id:, issue_id:)
                user =  User.find(user_id)
                user.likedIssues.delete(issue_id)
                user.save
                user
            end
        end
    end
end