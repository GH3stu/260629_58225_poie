class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "投稿しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])   # 編集対象の投稿を取得
  end

  def update
    @post = Post.find(params[:id])   # 更新対象の投稿を取得

    if @post.update(post_params)     # 更新処理
      redirect_to @post, notice: "投稿を更新しました"
    else
      render :edit, status: :unprocessable_entity   # バリデーション失敗時
    end
  end

  def destroy
    @post = Post.find(params[:id])   # 削除対象の投稿を取得
    @post.destroy                    # 削除処理
    redirect_to posts_path, notice: "投稿を削除しました"
  end

  def search
  end


  private

  def set_post
    @post = Post.find(params[:id])   # ここに追加
  end

  def require_owner
    unless @post.user_id == current_user.id   # ここに追加
      redirect_to posts_path, alert: "権限がありません"
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

