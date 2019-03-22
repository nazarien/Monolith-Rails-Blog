class CommentsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    comment = Comment.find(params[:id])
    authorize comment
    comment.destroy
    redirect_to send("#{comment.commentable.class.to_s.downcase}_path", comment.commentable)
  end
  
  def create
    comment = Comment.new(comment_params)
    authorize comment
    if comment.save
      flash[:notice] = "Saved"
      redirect_to send("#{comment.commentable.class.to_s.downcase}_path", comment.commentable)
    else
      flash[:notice] = "Don't save"
      redirect_to send("#{comment.commentable.class.to_s.downcase}_path", comment.commentable)
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:commenter, :body, :commentable_id, :commentable_type)
  end
end
