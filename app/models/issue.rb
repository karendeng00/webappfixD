class Issue < ApplicationRecord
    belongs_to :user

    # validates :type, presence: true

    scope :sn_issue, -> { where(type: 'SN') } 
    scope :pt_issue, -> { where(type: 'PT') } 
    scope :hrl_issue, -> { where(type: 'HRL') }
    scope :eam_issue, -> { where(type: 'EAM') }
    scope :dining_issue, -> { where(type: 'Dining') }
    

    ## Adds the "type" parameter to the json method
    def as_json(options={})
        super(options.merge({ methods: :type }))
    end
end
