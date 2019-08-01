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

    #The method called when an issue is updated after it has already been created.
    #This method redirects to the correct issue path depending on type and throws an
    #error if either issue user or type are missing.
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
                redirect_to new_pts_path(@issue)
            end
        else
            render json: {status: "error", code: 3000, messages: @issue.errors.messages}
        end
        
    end

    def show 
        @issue = Issue.find(params[:id])
    end

    def new 
        @issue = Issue.new
    end

    #The first method called when creating a new issue.
    #Once the type of issue has been established, the application is directed to
    #the corresponding issue path.
    #If the issue does not have a user or type, an error message is thrown.
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
                redirect_to new_pts_path(@issue)
            end
        else
            render json: {status: "error", code: 3000, messages: @issue.errors.messages}
        end
    end

    #Method called when a new OIT issue is created. This method corresponds to the
    #view which contains fields specific to OIT issues.
    def newOIT
        @issue = Issue.find(params[:id])
    end

    #Method called when a new HRL issue is created. This method corresponds to the
    #view which contains fields specific to HRL issues.
    def newHRL
        @issue = Issue.find(params[:id])
    end

    #Method called when a new FMD issue is created. This method corresponds to the
    #view which contains fields specific to FMD issues.
    def newFMD
        @issue = Issue.find(params[:id])
    end

    #Method called when a new PTS issue is created. This method corresponds to the
    #view which contains fields specific to PTS issues.
    def newPTS
        @issue = Issue.find(params[:id])
    end

    #Where issues are directed once all corresponding fields (both in the new.html.erb 
    #view and in the new[Issue].html.erb view) have been filled in.
    #Saves issues once they have been completely filled in.
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
