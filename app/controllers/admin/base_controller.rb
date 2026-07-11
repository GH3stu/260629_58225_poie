class Admin::BaseController < Admin::ApplicationController
  helper_method :current_admin, :admin_logged_in?

  private

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end

  def admin_logged_in?
    current_admin.present?
  end

  def require_admin
    unless admin_logged_in?
      redirect_to admin_login_path, alert: "ログインしてください"
    end
  end
end
