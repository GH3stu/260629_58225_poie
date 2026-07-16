class User::CommentsController < ApplicationController
  before_action :require_login

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to user_post_path(@post)
    else
      redirect_to user_post_path(@post), alert: "コメントを入力してください"
    end
  end

  def index
    @comments = current_user.comments.order(created_at: :desc)
  end

  def destroy
    # ここに追加
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    # 自分のコメントのみ削除可能
    if @comment.user_id == current_user.id
      @comment.destroy
    end

    redirect_to user_post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
