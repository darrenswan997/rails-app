class CommentsController < ApplicationController
  before_action :set_link
  before_action :authenticate_user!

  def create
    @comment = @link.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to link_path(@link)
  end

  def destroy
    @link = Link.find(params[:link_id])
    @comment = @link.comments.find(params[:id])
  @comment.destroy
  redirect_to link_path(@link)
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :link_id)
  end

  def set_link
    @link = Link.find(params[:link_id])
  end
end
