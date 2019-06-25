class IssuesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index 
        @issues = Issue.all
    end

    def json
        @issues = Issue.all
        render json: @issues
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
    end

    def create 
        @issue = Issue.new(issue_params)
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
        params.require(:issue).permit(:title, :description, :image, :location, :user_id)
    end 


end
