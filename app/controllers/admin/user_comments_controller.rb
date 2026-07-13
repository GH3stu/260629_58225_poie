class Admin::UserCommentsController < Admin::BaseController
  before_action :require_admin

  def index
    @comments = Comment.where(admin_id: nil).includes(:post, :user).order(created_at: :desc)
    # ユーザーコメントだけを取得（admin_id が nil）
  end

  def show
    @comment = Comment.find(params[:id])

    # 管理者コメントはここでは表示しない
    if @comment.admin_id.present?
      redirect_to admin_user_comments_path, alert: "ユーザーコメントのみ閲覧できます"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_user_comments_path
  end
end
