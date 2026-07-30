class Admin::TagsController < Admin::BaseController
  before_action :require_admin_login

  def index
    @tags = Tag.order(:name)
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to admin_tags_path, notice: "タグを削除しました"
  end

  private

  def require_admin_login
    unless session[:admin_id]
      redirect_to admin_login_path, alert: "ログインしてください"
    end
  end
end
