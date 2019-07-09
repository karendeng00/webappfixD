module Mutations
    module Issues
        class DeleteFavoriteFromIssue < BaseMutation
            
            argument :id, ID, required: true

            type Types::IssueType

            def resolve(id:)
                issue = Issue.find(id)
                issue.favorites = issue.favorites - 1
                issue.save
                issue
            end
        end
    end
end
