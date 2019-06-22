module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :all_items, [IssueType], null:false do 
      description "Return all Items"
    end

    def all_items
      Issue.all
    end

    field :issue_by_id, [IssueType], null: false do
      argument :id, String, required: true
      description "Return the Issue by ID"
    end
    
    def issue_by_id(id:)
      Issue.where(id: id)
    end
    
  end
end
