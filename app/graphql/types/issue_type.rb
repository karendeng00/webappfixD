module Types
  class IssueType < Types::BaseObject
    field :id, ID, null:false
    field :title, String, null:true
    field :description, String, null:false
    field :image, String, null:true
    field :location, String, null:true
    field :user_id, Integer, null:true
    field :type, String, null:true
    field :likes, Integer, null:true
    field :favorites, Integer, null:true
    field :email, String, null:true
    field :phone, String, null:true
    field :alternate_phone, String, null:true
    field :group, String, null: true
    field :urgency, String, null: true
    field :impact, String, null:true
    field :sensitive_info, String, null:true
    field :campus, String, null:true
    field :area, String, null:true
    field :specific_location, String, null:true
    field :room_number, String, null:true
    field :service_animal, String, null:true
    field :impact, Boolean, null:true
    field :your_building, String, null:true
    field :your_floor, String, null:true
    field :your_room, String, null:true
    field :request_type, String, null:true
    field :issue_building, String, null:true
    field :issue_floor, String, null:true
    field :issue_room, String, null:true
    field :service_type, String, null:true
    field :fund_code, String, null:true
    field :topic, String, null:true
    field :name, String, null:true
    field :created_at, String, null:true
 
  end
end
