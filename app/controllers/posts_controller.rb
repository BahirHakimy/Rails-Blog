require_relative '../models/user'
require_relative '../models/post'
class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to user_posts_path(user_id: current_user.id)
    else
      puts 'not valid'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :author_id)
  end
end
