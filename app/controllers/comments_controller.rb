class CommentsController < ApplicationController

  def create
    @record = Record.find(params[:record_id])
    @comment = @record.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render :index
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :record_id, :user_id)
  end
end
