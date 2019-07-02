module Mutations
    module Comments
        class CreateComment < BaseMutation

            argument :body, String, required: true
            argument :user_id, Integer, required: true
            argument :issue_id, Integer, required: true

            type Types::CommentType

            def resolve(body:, user_id:, issue_id:)
                Comment.create!(body: body, user_id: user_id, issue_id: issue_id)
            end
        end
    end
end
