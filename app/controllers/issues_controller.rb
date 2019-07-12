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

    def newOIT
        @issue = Issue.find(params[:id])
        @issue.update(issue_params)
        redirect_to newOIT
    end

    # def setPath
    #     # @issue = Issue.new
    #     # @issue.title = params[:issue][:title]
    #     # @issue.description = params[:issue][:description]
    #     # @issue.location = params[:issue][:location]
    #     # @issue.image = params[:issue][:image]
    #     # @issue.user_id = params[:issue][:user_id]
    #     # @issue.type = params[:issue][:type]
    #     # @issue.favorites = 0
    #     # @issue.likes = 0

    #     if @issue.type == "SnIssue"
    #         render "newOIT"
    #     elsif @issue.type == "HrlIssue"
    #         render "newHRL"
    #     elsif @issue.type == "EamIssue"
    #         render "newFMD"
    #     elsif @issue.type == "PtIssue"
    #         render "newPTS"
    #     end

    # end

    def create 
        @issue = Issue.new(issue_params)
        @issue.favorites = 0
        @issue.likes = 0
        @issue.save

        if User.exists?(id: @issue.user_id)
            if @issue.type == "SnIssue"
                @issue.newOIT
                @issue.save
            end
        else
            render json: {status: "error", code: 3000, message: "User does not exist! \n Create issues with existing Users only."}
        end
    end

    # def create 
    #     @issue = Issue.new(issue_params)
    #     @issue.favorites = 0
    #     @issue.likes = 0
    #     if User.exists?(id: @issue.user_id)
    #         @issue.save
    #         redirect_to issues_path
    #     else
    #         render json: {status: "error", code: 3000, message: "User does not exist! \n Create issues with existing Users only."}
    #     end
    # end

    def destroy 
        @issue = Issue.find(params[:id])
        @issue.destroy
        redirect_to issues_path
    end

    #Define the parameters of an Issue
    private def issue_params
        params.require(:issue).permit(:title, :description, :image, :location, :user_id, :type, :likes, :favorites, 
                                      :email, :phone, :alternate_phone, :group, 
                                      :urgency, :impact, :sensitive_info, :campus, :area,
                                      :specific_location, :room_number, :service_animal, :impact,
                                      :your_building, :your_floor, :your_room, :request_type,
                                      :issue_building, :issue_floor, :issue_room, :service_type,
                                      :fund_code, :topic, :name)
    end 
        
end
