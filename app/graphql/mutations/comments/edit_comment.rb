module Mutations
    module Comments
        class EditComment < BaseMutation

            argument :id, ID, required: true
            argument :body, String, required: false
            argument :user_id, Integer, required: false
            argument :issue_id, Integer, required: false
            argument :image, String, required: true

            type Types::CommentType

            def resolve(id:, body: nil, user_id: nil, issue_id: nil, image: nil)
                comment = Comment.find(id)
                if body != nil
                    comment.body = body
                end
                if user_id != nil
                    comment.user_id = user_id
                end
                if issue_id != nil
                    comment.issue_id = issue_id
                end
                if image != nil
                    comment.image = image
                end
                comment.save
                comment
            end
        end
    end
end