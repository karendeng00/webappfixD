module Mutations
    module Issues
        class AddLikeToIssue < BaseMutation
            
            argument :id, Int, required: true

            type Types::IssueType

            def resolve(id:)
                issue = Issue.find(id)
                issue.likes = issue.likes + 1
                issue.save
                issue
            end
        end
    end
end
