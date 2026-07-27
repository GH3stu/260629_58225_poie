class Admin::SessionsController < Admin::BaseController
  skip_before_action :require_admin, only: [:new, :create]

  def new
  end

  def create
    email = params[:email].presence || params.dig(:admin, :email).presence
    admin = Admin.find_by(email: email) || Admin.find_by(email_address: email)
    password = params[:password].presence || params.dig(:admin, :password)

    if admin&.authenticate(password)
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
