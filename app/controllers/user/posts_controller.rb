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
      save_tags(@post)
      redirect_to user_post_path(@post), notice: "投稿しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @posts = current_user.posts.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    if !logged_in? && @post.admin_id.nil?
      redirect_to login_path
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      save_tags(@post)
      redirect_to user_post_path(@post), notice: "投稿を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to user_user_path(current_user), notice: "投稿を削除しました" 
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def require_owner
    unless @post.user_id == current_user.id
      redirect_to user_posts_path, alert: "権限がありません"
    end
  end

  def save_tags(post)
    return unless params[:post][:tag_names]

    tag_names = params[:post][:tag_names].split(",").map(&:strip).reject(&:empty?)
    tags = tag_names.map { |name| Tag.find_or_create_by(name: name) }

    post.tags = tags
  end

  def post_params
    params.require(:post).permit(
      :title, :body, :category_id, :sub_category_id, :purpose_id)
  end
end
