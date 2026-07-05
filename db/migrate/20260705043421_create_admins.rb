class Admin::SessionsController < ApplicationController
  def create
    admin = Admin.find_by(email_address: params[:email])   # 修正ポイント
    if admin&.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to admin_login_path
  end
end
