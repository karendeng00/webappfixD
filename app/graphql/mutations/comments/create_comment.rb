module Mutations
    module Comments
        class CreateComment < BaseMutation

            argument :body, String, required: true
            argument :image, String, required: false
            argument :user_id, Integer, required: true
            argument :issue_id, Integer, required: true

            type Types::CommentType

            def resolve(body:, user_id:, issue_id:, image:)
                Comment.create!(body: body, user_id: user_id, issue_id: issue_id, image: image)
            end
        end
    end
end