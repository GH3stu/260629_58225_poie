class Admin::UsersController < Admin::BaseController
  before_action :require_admin

  def index
    @users = User.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: "ユーザーを退会させました"
  end

  private

  def require_admin
    unless admin_logged_in?
      redirect_to admin_login_path
    end
  end
end