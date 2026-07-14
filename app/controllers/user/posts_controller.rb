class User::PostsController < ApplicationController
  before_action :require_login
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]
  before_action :require_owner, only: [ :edit, :update, :destroy ]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_post_path(@post), notice: "投稿しました"   # 修正
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    # 非ログインユーザーは管理者投稿のみ閲覧可能
    if !logged_in? && @post.admin_id.nil?
      redirect_to login_path
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)   # category_id を含む
      redirect_to user_post_path(@post), notice: "投稿を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path, notice: "投稿を削除しました"   # 修正
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def require_owner
    unless @post.user_id == current_user.id
      redirect_to user_posts_path, alert: "権限がありません"   # 修正
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
