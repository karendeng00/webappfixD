module Types
    class UserType < Types::BaseObject
        field :id, ID, null: false
        field :name, String, null: false
        field :netid, String, null: false
        field :phone, String, null: false
        field :picture, String, null: false
        field :alt_phone, String, null: false
        field :email, String, null: false
    end
  end
  