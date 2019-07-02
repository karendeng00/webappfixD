module Types
  class QueryType < Types::BaseObject

    # Return All Issues
    field :all_issues, [IssueType], null:false do
      description "Return all Issues"
    end

    # Return Issues by ID
    field :issue_by_id, IssueType, null: false do
      argument :id, Integer, required: true
      description "Return the Issue by ID"
    end

    # Return All Issues of a Specific User
    field :issues_by_user, [IssueType], null: false do
      argument :user, String, required: true
      description "Return all Issues of a specific User"
    end

    # Return All Issues of a Specific Type
    field :issues_by_type, [IssueType], null: false do
      argument :type, String, required: true
      description "Return all Issues of a specific Type"
    end

    # Return All Users
    field :all_users, [UserType], null: false do
      description "Return all Users"
    end

    # Return User by ID
    field :user_by_id, UserType, null: false do
      argument :id, Integer, required:true
      description "Return User of Specific ID"
    end

    # Return Comment by ID
    field :comment_by_id, CommentType, null: false do
      argument :id, Integer, required: true
      description "Return Comment of specific ID"
    end

    # Return Comments of a Specific Issue
    field :comments_by_issue, [CommentType], null: false do
      argument :issue_id, Integer, required:true
      description "Return Comments of a Specific Issue"
    end

    # Return Comments of a specific User
    field :comments_by_user, [CommentType], null:false do
      argument :user_id, Integer, required:true
      description "Return all Comments of a Specific User"
    end


    def all_issues
      Issue.all
    end

    def issue_by_id(id:)
      Issue.find(id)
    end
  
    def issues_by_user(user:)
      Issue.where(user: user)
    end

    def issues_by_type(type:)
      Issue.where(type: type)
    end

    def all_users
      User.all
    end

    def user_by_id(id:)
      User.find(id)
    end

    def comment_by_id(id:)
      Comment.find(id)
    end

    def comments_by_issue(issue_id:)
      Comment.where(issue_id: issue_id)
    end

    def comments_by_user(user_id:)
      Comment.where(user_id: user_id)
    end

  end
end
