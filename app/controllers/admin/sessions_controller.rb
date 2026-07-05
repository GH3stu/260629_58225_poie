class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(email_address: params[:email]) 
    if admin&.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_posts_path   # ここを追加
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to admin_login_path     # ここを追加
  end
end

