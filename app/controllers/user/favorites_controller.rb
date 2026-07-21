class User::FavoritesController < ApplicationController
  before_action :require_login
  before_action :set_post

  def create
    current_user.favorites.find_or_create_by(post: @post)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: user_post_path(@post) }
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(post: @post)
    favorite&.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: user_post_path(@post) }
    end
  end

  private

  def require_login
    unless current_user
      head :unauthorized   # ★ Turbo を壊さない正しい未ログイン処理
    end
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
