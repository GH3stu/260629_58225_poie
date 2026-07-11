class Admin::AdminsController < Admin::BaseController
  before_action :require_admin

  def edit
    @admin = current_admin
  end

  def update
    @admin = current_admin

    if @admin.update(admin_params)
      redirect_to admin_root_path, notice: "管理者情報を更新しました"
    else
      render :edit
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end
end
