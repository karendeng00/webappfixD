module Mutations
    module Users
        class AddFavToUser < BaseMutation

            argument :id, Int, required: true

            type Types::UserType

            def resolve(id:)
                
            end
        end
    end
end