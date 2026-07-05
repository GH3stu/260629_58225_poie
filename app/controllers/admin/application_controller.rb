class Admin::ApplicationController < ActionController::Base
  before_action :require_admin_login

  private

  def require_admin_login
    unless session[:admin_id]
      redirect_to admin_login_path, alert: "管理者ログインが必要です"
    end
  end
end