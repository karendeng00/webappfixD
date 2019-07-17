class CommentsController < ApplicationController

    def index
        @comments = Comment.all
    end

    def new 
        @comment = Comment.new
        @issue = Issue.new
    end

    def update 
        @comment = Comment.find(params[:id])
        @comment.update(comment_params)
        if User.exists?(id: @comment.user_id) && Issue.exists?(id: @comment.issue_id)
            redirect_to comment_path
        else
            render json: {status: "error", code: 3000, message: "User does not exist! \n Create issues with existing Users only."}
        end
    end

    def destroy 
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to comments_path
    end

    def show 
        @comment = Comment.find(params[:id])
    end

    def create 
        @comment = Comment.new(comment_params)
        logger.debug "ERROR" + comment_params.inspect
        if User.exists?(id: @comment.user_id) && Issue.exists?(id: @comment.issue_id)
            @comment.save
            redirect_to comments_path
        else
            render json: {status: "error", code: 3000, message: "User does not exist! \n Create issues with existing Users only."}
        end
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    private def comment_params
        params.require(:comment).permit(:body, :issue_id, :user_id, :image)
    end 

    
end
