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
        redirect_to @issue
    end

    def show 
        redirect_to issues_path
    end

    def new 
        @issue = Issue.new
    end

    def create 
        @issue = Issue.new(issue_params)
        @issue.save
        redirect_to issues_path
    end
    
    def destroy 
        @issue = Issue.find(params[:id])
        @issue.destroy
        redirect_to issues_path
    end

    def createIssueMobile
        @issue = Issue.new(issue_params)
        if @issue.save
          render json: @issue, status: :created
        else
          render json: @issue.errors, status: :unprocessable_entity
        end
    end


    #Define the parameters of an Issue
    private def issue_params
        params.require(:issue).permit(:title, :description, :image, :location, :user, :user_image, :date, :time)
    end 


end
