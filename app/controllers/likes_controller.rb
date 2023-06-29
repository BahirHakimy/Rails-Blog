# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:user_id])
    post = Post.find(params[:id])
    like = Like.new(user:, post:)
    if like.save
      like.update_likes_counter
      redirect_to user_post_path(user_id: current_user.id, id: params[:id])
    else
      flash.now[:error] = 'Error: Cant like the post'
    end
  end
end
