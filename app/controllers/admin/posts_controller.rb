class Admin::PostsController < Admin::BaseController
  layout "admin"
  before_action :require_admin, except: [:show]

  def index
    if params[:category_id].present?
      @posts = Post.where.not(admin_id: nil)
                   .where(category_id: params[:category_id])
                   .order(created_at: :desc)
    else
      @posts = Post.where.not(admin_id: nil)
                   .order(created_at: :desc)
    end
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)   # category_id を含む
      redirect_to admin_post_path(@post), notice: "投稿を更新しました"
    else
      render :edit
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, notice: "投稿を削除しました"
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :sub_category_id)
  end

  def require_admin
    unless admin_logged_in?
      redirect_to admin_login_path
    end
  end
end
