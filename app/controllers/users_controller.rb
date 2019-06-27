class UsersController < ApplicationController
    
    def index
        @users = User.all
    end

    def edit 
        @user = User.find(params[:id])
    end    

    def update 
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to users_path
    end

    def show
        @user = User.find(params[:id])
        @issues = Issue.where(user_id: @user.id)
        @comments = Comment.where(user_id: @user.id)
    end

    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        @user.save
        redirect_to users_path
    end

    def destroy 
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    #Define the parameters of an User
    private def user_params
        params.require(:user).permit(:name, :netid, :phone, :picture)
    end 

end
