class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      redirect_to @user, notice: "ログインしました"
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def show
    @posts = @user.posts 
  end

  def edit
  end

  def update
    if @user.update(user_params)        # 更新処理
      redirect_to @user, notice: "ユーザー情報を更新しました"   # 更新成功時
    else
      render :edit, status: :unprocessable_entity   # 更新失敗時
    end
  end

  def destroy
    @user.destroy
    reset_session
    redirect_to new_user_path, notice: "退会しました"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def require_owner
    unless @user.id == current_user.id
      redirect_to user_path(current_user), alert: "権限がありません"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation) 
  end
end

