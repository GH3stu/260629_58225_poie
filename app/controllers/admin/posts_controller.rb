class Admin::PostsController < Admin::BaseController
  before_action :require_admin

  def index
    @posts = Post.where.not(admin_id: nil)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.admin_id = current_admin.id   # 管理者投稿として保存

    if @post.save
      redirect_to admin_post_path(@post), notice: "投稿を作成しました"
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, notice: "投稿を削除しました"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)   # ここに追加
  end

  def require_admin
    unless admin_logged_in?
      redirect_to admin_login_path
    end
  end
end
