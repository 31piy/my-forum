class CommentsController < ApplicationController
  before_action :init_post, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.parent.nil?
      @comment.parent = @post
    end

    @comment.save!
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:body, parent: [:id, :type])
  end

  def init_post
    @post = Post.find_by(id: params[:post_id])
    return render status: :not_found unless @post
  end
end
