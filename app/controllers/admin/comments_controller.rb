class Admin::CommentsController < Admin::BaseController
  before_action :require_admin

  def index
    @comments = Comment.includes(:user, :post).order(created_at: :desc)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path, notice: "コメントを削除しました"
  end

  private

  def require_admin
    unless admin_logged_in?
      redirect_to admin_login_path
    end
  end
end
