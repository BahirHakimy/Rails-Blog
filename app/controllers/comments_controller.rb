# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:id])
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to user_post_path(user_id: current_user.id, id: params[:post_id])
    else
      flash.now[:error] = 'Error: Comment could not be saved'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id, :user_id)
  end
end
