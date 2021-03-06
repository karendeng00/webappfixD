module Mutations
    module Issues
        class DeleteIssue < BaseMutation
            
            argument :id, Int, required: true
        
            type Types::IssueType

            def resolve(id:)
                issue = Issue.find(id)
                issue.destroy
                issue
            end
        end
    end
end
