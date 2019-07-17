module Types
    class CommentType < Types::BaseObject
        field :id, ID, null: false
        field :body, String, null: false
        field :user_id, Integer, null: false
        field :issue_id, Integer, null: false
        field :image, String, null: false
    end
  end
  