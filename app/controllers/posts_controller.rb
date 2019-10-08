class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).order(updated_at: :desc).all
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save!

    redirect_to @post
  end

  def show
    @post = Post.includes(comments: [:user]).find_by(id: params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
