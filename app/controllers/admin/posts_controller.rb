class Admin::PostsController < Admin::BaseController
  before_action :require_admin

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, notice: "投稿を削除しました"
  end

  private

  def require_admin
    unless admin_logged_in?
      redirect_to admin_login_path
    end
  end
end
