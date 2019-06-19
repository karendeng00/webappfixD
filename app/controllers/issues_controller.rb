class IssuesController < ApplicationController
    def index 
        @issues = Issue.all
    end

    def show 
        @issue = Issue.find(params[:id])
    end

    def new 
    end

    def create 
        #render plain: params[:issue].inspect
        @issue = Issue.new(issue_params)
        @issue.save
        redirect_to @issue
    end

    private def issue_params
        params.require(:issue).permit(:title, :description, :image, :location, :user, :user_image, :date, :time)
    end 


end
