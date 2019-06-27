class Issue < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    # validates :type, presence: true
    
    ## Adds the "type" parameter to the json method
    def as_json(options={})
        super(options.merge({ methods: :type }))
    end
end
