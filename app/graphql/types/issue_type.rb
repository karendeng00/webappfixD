module Types
  class IssueType < Types::BaseObject
    field :id, ID, null:false
    field :title, String, null:false
    field :description, String, null:false
    field :image, String, null:false
    field :location, String, null:false
    field :user_id, Integer, null:false
    field :type, String, null:false
    field :likes, Integer, null:false
    field :favorites, Integer, null:false
    field :type, String, null:false
    field :email, String, null:false
    field :phone, String, null:false
    field :alternate_phone, String, null:false
    field :group, String, null: false
    field :urgency, String, null: false
    field :impact, String, null:false
    field :sensitive_info, String, null:false
    field :campus, String, null:false
    field :area, String, null:false
    field :specific_location, String, null:false
    field :room_number, String, null:false
    field :service_animal, String, null:false
    field :impact, Boolean, null:false
    field :your_building, String, null:false
    field :your_floor, String, null:false
    field :your_room, String, null:false
    field :request_type, String, null:false
    field :issue_building, String, null:false
    field :issue_floor, String, null:false
    field :issue_room, String, null:false
    field :service_type, String, null:false
    field :fund_code, String, null:false
    field :topic, String, null:false
    field :name, String, null:false
  end
end
