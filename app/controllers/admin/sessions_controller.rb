class Admin::SessionsController < Admin::BaseController
  skip_before_action :require_admin, only: [:new, :create]

  def new
  end

  def create
    admin = Admin.find_by(email_address: params[:email])   # email_address → email に変更
    # ここに追加

    if admin&.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:admin_id)
    redirect_to admin_login_path
  end
end
