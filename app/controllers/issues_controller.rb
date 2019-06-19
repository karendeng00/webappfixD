class IssuesController < ApplicationController
    def index 
        @issues = Issue.all
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
        @issue = Issue.find(params[:id])
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

    private def issue_params
        params.require(:issue).permit(:title, :description, :image, :location, :user, :user_image, :date, :time)
    end 


end
