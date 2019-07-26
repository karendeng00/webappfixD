class User < ApplicationRecord
    has_many :issues, dependent: :destroy
    has_many :comments, dependent: :destroy

    def liked_issues
        likedIssues
    end

    def favorited_issues
        favoritedIssues
    end
end
