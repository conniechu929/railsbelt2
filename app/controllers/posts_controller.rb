class PostsController < ApplicationController
  before_action :require_login
  def index
    @user = User.find(session[:user_id])
    @posts = Post.all
  end

  def create
    @post = Post.create(user_id:params[:user_id], content:params[:content])
    redirect_to "/bright_ideas"
  end

  def show
    @post = Post.find_by_id(params[:id])

  end

  def delete
    post = Post.find_by_id(params[:post_id])
    post.destroy if post.user_id == session[:user_id]
    redirect_to "/bright_ideas"
  end
end
