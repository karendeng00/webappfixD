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
  end
end
