class User::PostsController < ApplicationController
  before_action :require_login
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]
  before_action :require_owner, only: [ :edit, :update, :destroy ]

  def new
    @post = Post.new
    @tags = Tag.all 
  end

  def create
    @post = current_user.posts.build(post_params)

    @post.score = LanguageService.get_score(@post.body) #  AIスコア付与

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
    # before_actionのset_postで取得済み
  end

  def edit
    @tags = Tag.all
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
    # namespace :user 内の users resources のため user_user_path になります
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

  # -----------------------------
  # タグ保存処理（チェックボックス + 自由入力）
  # -----------------------------
  def save_tags(post)
    selected_tag_ids = Array(params.dig(:post, :tag_ids)).reject(&:blank?)
    post.tag_ids = selected_tag_ids

    if params.dig(:post, :tag_names).present?
      tag_names = params[:post][:tag_names].split(",").map(&:strip).reject(&:empty?)

      tag_names.each do |name|
        formatted_name = name.start_with?("#") ? name : "##{name}"

        tag = Tag.find_or_create_by(name: formatted_name)
        post.tags << tag unless post.tags.include?(tag)
      end
    end
  end

  def post_params
    params.require(:post).permit(
      :title, :body, :category_id, :sub_category_id, :purpose_id,
      tag_ids: []
    )
  end
end
