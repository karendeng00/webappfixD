module Types
  class IssueType < Types::BaseObject
    field :id, ID, null:false
    field :title, String, null:false
    field :description, String, null:false
    field :image, String, null:false
    field :location, String, null:false
    field :user, String, null:false
    field :user_image, String, null:false
  end
end
