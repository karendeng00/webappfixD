module Mutations
    module Issues
        class CreateIssue < BaseMutation
            argument :title, String, required: true
            argument :description, String, required: false
            argument :image, String, required: false
            argument :location, String, required: false
            argument :user_id, Integer, required: true
            argument :type, String, required: true
            argument :likes, Integer, required: true
            argument :favorites, Integer, required: true
            argument :email, String, required: false
            argument :phone, String, required: false
            argument :alternate_phone, String, required:false
            argument :group, String, required: false
            argument :urgency, String, required: false
            argument :sensitive_info, String, required: false
            argument :campus, String, required: false
            argument :area, String, required: false
            argument :specific_location, String, required: false
            argument :room_number, String, required: false
            argument :service_animal, String, required: false
            argument :impact, Boolean, required: false
            argument :your_building, String, required: false
            argument :your_floor, String, required: false
            argument :your_room, String, required: false
            argument :request_type, String, required: false
            argument :issue_building, String, required:false
            argument :issue_floor, String, required:false
            argument :issue_room, String, required:false
            argument :service_type, String, required:false
            argument :fund_code, String, required:false
            argument :topic, String, required:false
            argument :name, String, required:false
 
            type Types::IssueType

            def resolve(title:, description: nil, image: nil, location: nil, user_id: nil, type:, likes:, favorites:,
                email: nil, phone: nil, alternate_phone: nil, group: nil, urgency: nil, sensitive_info: nil, campus: nil, area: nil, 
                specific_location: nil, room_number: nil, service_animal: nil, impact: nil, your_building: nil, your_floor: nil, 
                your_room: nil, request_type: nil, issue_building: nil, issue_floor: nil, issue_room: nil, service_type: nil, 
                fund_code: nil, topic: nil, name: nil)
                Issue.create!(title: title, description: description,
                image: image, location: location, user_id: user_id, type: type, likes: likes, favorites: favorites,
                email: email, phone: phone, alternate_phone: alternate_phone, group: group, 
                urgency: urgency, sensitive_info: sensitive_info, campus: campus, area: area, 
                specific_location: specific_location, room_number: room_number, service_animal: service_animal,
                impact: impact, your_floor: your_floor, your_building: your_building, your_room: your_room, request_type: request_type,
                issue_building: issue_building, issue_floor: issue_floor, issue_room: issue_room, service_type: service_type, 
                fund_code: fund_code, topic: topic, name: name)
            end
        end
    end
end

