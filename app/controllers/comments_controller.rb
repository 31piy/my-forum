class CommentsController < ApplicationController
  before_action :init_post, only: [:create]
  before_action :init_parent, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.save!
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :parent_id, :parent_type)
  end

  def init_post
    @post = Post.find_by(id: params[:post_id])
    return render status: :not_found unless @post
  end

  def init_parent
    @parent = Object.
              const_get(comment_params[:parent_type]).
              find_by(id: comment_params[:parent_id])

    return render status: :not_found unless @parent
  end
end
