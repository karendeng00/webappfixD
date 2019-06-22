module Types
  class QueryType < Types::BaseObject

    # Return All Items
    field :all_items, [IssueType], null:false do 
      description "Return all Items"
    end

    def all_items
      Issue.all
    end


    # Return Issues by ID
    field :issue_by_id, [IssueType], null: false do
      argument :id, String, required: true
      description "Return the Issue by ID"
    end
    
    def issue_by_id(id:)
      Issue.where(id: id)
    end
    

    # Return All Issues of a specific User
    field :issues_by_user, [IssueType], null: false do 
      argument :user, String, required: true
      description "Return all Issues of a specific User"
    end

    def issues_by_user(user:)
      Issue.where(user: user)
    end

  end
end
