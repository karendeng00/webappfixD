class Issue < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    validates :type, presence: true
    
end
