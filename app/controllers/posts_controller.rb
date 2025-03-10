class PostsController < ApplicationController
  def index
    posts = Post.includes(:user).order(id: :desc).limit(5)
    posts = posts.where(id: ...params[:before]) if params[:before].present?
    @posts = posts
  end
end
