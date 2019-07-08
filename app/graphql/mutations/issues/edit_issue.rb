module Mutations
    module Issues
        class EditIssue < BaseMutation
            
            argument :id, ID, required: true
            argument :title, String, required: false
            argument :description, String, required: false
            argument :image, String, required: false
            argument :location, String, required: false
            argument :user_id, Integer, required: false
            argument :type, String, required: false
            argument :likes, Integer, required: false
            argument :favorites, Integer, required: false
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

            def resolve(id:, title: nil, description: nil, image: nil, location: nil, user_id: nil, 
                type: nil, likes: nil, favorites: nil,
                email: nil, phone: nil, alternate_phone: nil, group: nil, urgency: nil, sensitive_info: nil, campus: nil, area: nil, 
                specific_location: nil, room_number: nil, service_animal: nil, impact: nil, your_floor: nil, 
                your_room: nil, request_type: nil, issue_building: nil, issue_floor: nil, issue_room: nil, service_type: nil, 
                fund_code: nil, topic: nil, name: nil)
                issue = Issue.find(id)
                if title != nil
                    issue.title = title
                end
                if description != nil
                    issue.description = description
                end
                if image != nil
                    issue.image = image
                end
                if location != nil
                    issue.location = location
                end
                if user_id != nil
                    issue.user_id = user_id
                end
                if type != nil
                    issue.type = type
                end
                if likes != nil 
                    issue.likes = likes
                end
                if favorites != nil 
                    issue.favorites = favorite
                end
                if email != nil 
                    issue.email = email
                end
                if phone != nil 
                    issue.phone = phone
                end  
                if alternate_phone != nil 
                    issue.alternate_phone = alternate_phone
                end
                if group != nil
                    issue.group = group
                end
                if urgency != nil
                    issue.urgency = urgency
                end
                if sensitive_info != nil
                    issue.sensitive_info = sensitive_info
                end
                if campus != nil
                    issue.campus = campus
                end
                if area != nil
                    issue.area = area
                end
                if specific_location != nil
                    issue.specific_location = specific_location
                end
                if room_number != nil
                    issue.room_number = room_number
                end
                if service_animal != nil
                    issue.service_animal = service_animal
                end
                if impact != nil
                    issue.impact = impact
                end
                if your_floor != nil
                    issue.your_floor = your_floor
                end
                if your_room != nil
                    issue.your_room = your_room
                end
                if request_type != nil
                    issue.request_type = request_type
                end
                if issue_building != nil
                    issue.issue_building = issue_building
                end
                if issue_floor != nil
                    issue.issue_floor = issue_floor
                end
                if issue_room != nil
                    issue.issue_room = issue_room
                end
                if service_type != nil
                    issue.service_type = service_type
                end
                if fund_code != nil
                    issue.fund_code = fund_code
                end
                if topic != nil
                    issue.topic = topic 
                end
                if name != nil
                    issue.name = name
                end
                issue.save
                issue
            end
        end
    end
end
