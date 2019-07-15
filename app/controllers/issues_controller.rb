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
            if @issue.type == "SnIssue"
                redirect_to new_oit_path(@issue)
            elsif @issue.type == "HrlIssue"
                redirect_to new_hrl_path(@issue)
            elsif @issue.type == "EamIssue"
                redirect_to new_fmd_path(@issue)
            elsif @issue.type == "PtIssue"
                redirect_to new_pt_path(@issue)
            end
        else
            #render json: {status: "error", code: 3000, message: "User does not exist! \n Create issues with existing Users only."}
            render json: {status: "error", code: 3000, messages: @issue.errors.messages}
        end
        
    end

    def show 
        @issue = Issue.find(params[:id])
    end

    def new 
        @issue = Issue.new
        #logger.debug "issue id: " + @issue.id
    end

    def create 
        @issue = Issue.new(issue_params)
        @issue.favorites = 0
        @issue.likes = 0
        

        if @issue.save #&& User.exists?(id: @issue.user_id)
            if @issue.type == "SnIssue"
                redirect_to new_oit_path(@issue)
            elsif @issue.type == "HrlIssue"
                redirect_to new_hrl_path(@issue)
            elsif @issue.type == "EamIssue"
                redirect_to new_fmd_path(@issue)
            elsif @issue.type == "PtIssue"
                redirect_to new_pt_path(@issue)
            end
        else
            # render json: {status: "error", code: 3000, message: "User does not exist! \n Create issues with existing Users only."}
            render json: {status: "error", code: 3000, messages: @issue.errors.messages}
        end
    end

    def newOIT
        @issue = Issue.find(params[:id])
    end

    def newHRL
        @issue = Issue.find(params[:id])
    end

    def newFMD
        @issue = Issue.find(params[:id])
    end

    def newPT
        @issue = Issue.find(params[:id])
    end

    def updateIssue
        @issue = Issue.find(params[:id])
        @issue.update(issue_params)
        @issue.save

        redirect_to issues_path
    end

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
