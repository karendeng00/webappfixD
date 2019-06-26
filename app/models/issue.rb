class Issue < ApplicationRecord
    belongs_to :user


    # validates :type, presence: true


    # before_save :set_type 
    # TYPES = %w( DiningIssue EamIssue HrlIssue PtIssue SnIssue )

    # def set_type
    #     raiser "Override Method in Subclasses!"
    # end





    ## Adds the "type" parameter to the json method
    def as_json(options={})
        super(options.merge({ methods: :type }))
    end
end
