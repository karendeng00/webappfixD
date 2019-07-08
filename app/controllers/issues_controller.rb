class IssuesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @issues = Issue.all
    end

    def json
        @issues = Issue.all
        render json: @issues
    end

    def jsonByIssue
        @issue = Issue.find(params[:id])
        render json: @issue
    end

    def edit 
        @issue = Issue.find(params[:id])
    end    

    def update 
        @issue = Issue.find(params[:id])
        @issue.update(issue_params)
        if User.exists?(id: @issue.user_id)
            redirect_to issues_path
        else
            render json: {status: "error", code: 3000, message: "User does not exist! \n Create issues with existing Users only."}
        end
        
    end

    def show 
        @issue = Issue.find(params[:id])
    end

    def new 
        @issue = Issue.new
        #logger.debug "issue id: " + @issue.id
    end

    # def newOIT
    #     @issue = Issue.new
    #     @issue.title = params[:issue][:title]
    #     @issue.user_id = params[:issue][:user_id]
    #     @issue.description = params[:issue][:description]
    #     logger.debug "@issue.user_id: " + @issue.user_id.to_s
    #     #@issue.save
    # end

    def setPath
        @issue = Issue.new
        @issue.title = params[:issue][:title]
        @issue.description = params[:issue][:description]
        @issue.location = params[:issue][:location]
        @issue.image = params[:issue][:image]
        @issue.user_id = params[:issue][:user_id]
        @issue.type = params[:issue][:type]

        if @issue.type == "SnIssue"
            oitPath
        elsif @issue.type == "HrlIssue"
            render "newHRL"
        elsif @issue.type == "EamIssue"
            render "newFMD"
        elsif @issue.type == "PtIssue"
            render "newPTS"
        end

        @issue.save

     end

    def oitPath
        render "newOIT"
        # @issue = Issue.where(id: @issue.id)
        # @issue.urgency = params[:urgency]
        # @issue.impact = params[:issue][:impact]
        # @issue.sensitive_info = params[:issue][:sensitive_info]
    end

    def create 
        @issue = Issue.new(issue_params)
        logger.debug "@issue: " + @issue.inspect
        # @issue.favorites = 0
        # @issue.likes = 0
        if User.exists?(id: @issue.user_id)
            @issue.save
            redirect_to issues_path
        else
            render json: {status: "error", code: 3000, message: "User does not exist! \n Create issues with existing Users only."}
        end
    end

    def createIssueMobile
        @issue = Issue.new(issue_params)
        if User.exists?(id: @issue.user_id)
            @issue.save
        else
            render json: {status: "error", code: 3000, message: "User does not exist! \n Create issues with existing Users only."}
        end
        if @issue.save
          render json: @issue, status: :created
        else
          render json: @issue.errors, status: :unprocessable_entity
        end
    end

    def destroy 
        @issue = Issue.find(params[:id])
        @issue.destroy
        redirect_to issues_path
    end

    #Define the parameters of an Issue
    private def issue_params
        params.require(:issue).permit(:title, :description, :image, :location, :user_id, :type,
                                      :email, :phone, :name, :alternate_phone, :group, 
                                      :urgency, :impact, :sensitive_info, :campus, :area,
                                      :specific_location, :room_number, :service_animal,
                                      :your_building, :your_floor, :your_room, :request_type,
                                      :issue_building, :issue_floor, :issue_room, :service_type,
                                      :fund_code, :topic)
    end 


end
