class User < ApplicationRecord
    has_many :issues, dependent: :destroy
    has_many :comments, dependent: :destroy
end
