class User < ApplicationRecord
    has_many :issues, dependent: :destroy
end
