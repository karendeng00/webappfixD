module Types
    class UserType < Types::BaseObject
        field :id, ID, null: false
        field :name, String, null: true
        field :netid, String, null: false
        field :phone, String, null: true
        field :picture, String, null: true
        field :alt_phone, String, null: true
        field :email, String, null: true
        field :issues, [Types::IssueType], null: true
    end
  end
  