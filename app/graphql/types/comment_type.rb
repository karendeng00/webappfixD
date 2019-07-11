module Types
    class CommentType < Types::BaseObject
        field :id, ID, null: false
        field :body, String, null: false
        field :user_id, Integer, null: false
        field :issue_id, Integer, null: false
        field :created_at, String, null: true
    end
  end
  