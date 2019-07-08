module Mutations
    module Issues
        class EditIssue < BaseMutation

            argument :id, ID, required:true
            argument :title, String, required:false
            argument :description, String, required:false
            argument :image, String, required:false
            argument :location, String, required:false
            argument :user_id, Integer, required:false
            argument :type, String, required:false
            argument :likes, Integer, required:false
            argument :favorites, Integer, required:false
            argument :email, String, required:false
            argument :phone, String, required:false
            argument :alternate_phone, String, required:false
            argument :group, String, required: false
            argument :urgency, String, required: false
            argument :impact, String, required:false
            argument :sensitive_info, String, required:false
            argument :campus, String, required:false
            argument :area, String, required:false
            argument :specific_location, String, required:false
            argument :room_number, String, required:false
            argument :service_animal, String, required:false
            argument :your_building, String, required:false
            argument :your_floor, String, required:false
            argument :your_room, String, required:false
            argument :request_type, String, required:false
            argument :issue_building, String, required:false
            argument :issue_floor, String, required:false
            argument :issue_room, String, required:false
            argument :service_type, String, required:false
            argument :fund_code, String, required:false
            argument :topic, String, required:false
            argument :name, String, required:false


            type Types::IssueType

            def resolve(id:, title:)
                issue = Issue.find(id)
                
            end
        end
    end
end
