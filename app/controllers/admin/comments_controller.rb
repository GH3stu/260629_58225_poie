class Admin::CommentsController < Admin::BaseController
  before_action :require_admin

  def index
    @comments = Comment.where.not(admin_id: nil).includes(:post).order(created_at: :desc)
  end


  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.admin_id = current_admin.id

    if @comment.save
      if @post.admin_id.present?
        redirect_to admin_post_path(@post), notice: "コメントを投稿しました"
      else
        redirect_to admin_user_post_path(@post), notice: "コメントを投稿しました"
      end
    else
      if @post.admin_id.present?
        redirect_to admin_post_path(@post), alert: "コメントを入力してください"
      else
        redirect_to admin_user_post_path(@post), alert: "コメントを入力してください"
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path, notice: "コメントを削除しました"
  end

  private

  def comment_params
    params.require(:comment).permit(:body)   # ここに追加
  end

  def require_admin
    unless admin_logged_in?
      redirect_to admin_login_path
    end
  end
end
