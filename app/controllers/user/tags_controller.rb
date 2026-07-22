class User::TagsController < ApplicationController
  before_action :require_login

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts.order(created_at: :desc)
  end

  private

  def require_login
    unless current_user
      redirect_to login_path, alert: "ログインしてください"
    end
  end
end

