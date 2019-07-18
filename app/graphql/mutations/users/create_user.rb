module Mutations
    module Users
        class CreateUser < BaseMutation

            argument :name, String, required: true
            argument :netid, String, required: true
            argument :phone, String, required: true
            argument :picture, String, required: true

            type Types::UserType

            def resolve(name:, netid:, phone:, picture:)
                User.create!(name: name, netid: netid, phone: phone, picture: picture)
            end
        end
    end
end
