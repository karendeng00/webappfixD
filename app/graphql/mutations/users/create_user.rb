module Mutations 
    module User
        class CreateUser < BaseMutation

            argument :name, String, required: true
            argument :netid, String, required: true
            argument :phone, String, required: true
            argument :picture, String, required: true
            # argument :title, String, required: true
            # argument :description, String, required: true
            # argument :image, String, required: true
            # argument :location, String, required: true
            # argument :user_id, String, required: true
            # argument :type, String, required: true
        
            type Types::UserType    
            # type Types::IssueType

            # def resolve(title:, description:, image:, location: user_id:, type:)
            #    Issue.create!( title: title, description: description, image: image, location: location, user_id: user_id, type: type)
            # end

            def resolve(name:, netid:, phone:, picture:)
                User.create!(name: name, netid: netid, phone: phone, picture: picture)
            end
        end
    end
end