module Types
    class CommentType < Types::BaseObject
        field :id, ID, null: false
        field :body, String, null: true
        field :user_id, Integer, null: false
        field :issue_id, Integer, null: false
        field :created_at, String, null: true
        field :image, String, null:true
        field :user, Types::UserType, null:false
        field :issue, Types::IssueType, null:false
    end
  end
  