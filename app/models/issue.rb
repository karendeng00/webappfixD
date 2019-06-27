class Issue < ApplicationRecord
    belongs_to :user

    # validates :type, presence: true

    # scope :sn_issue, -> { where(type: 'SnIssue') } 
    # scope :pt_issue, -> { where(type: 'PtIssue') } 
    # scope :hrl_issue, -> { where(type: 'HrlIssue') }
    # scope :eam_issue, -> { where(type: 'EamIssue') }
    # scope :dining_issue, -> { where(type: 'DiningIssue') }



    ## Adds the "type" parameter to the json method
    def as_json(options={})
        super(options.merge({ methods: :type }))
    end
end
