class Admin::UserPostsController < Admin::BaseController
  before_action :require_admin

  def index
    @posts = Post.where(admin_id: nil).includes(:user).order(created_at: :desc)
    # ユーザー投稿だけを取得（admin_id が nil）
  end

  def show
    @post = Post.find(params[:id])

    # 管理者投稿はここでは表示しない
    if @post.admin_id.present?
      redirect_to admin_user_posts_path, alert: "ユーザー投稿のみ閲覧できます"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_user_posts_path
  end
end
