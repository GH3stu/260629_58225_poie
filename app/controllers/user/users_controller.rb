class User::UsersController < ApplicationController
  before_action :require_login
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_owner, only: [:edit, :update, :destroy]

  def show
    @posts = @user.posts
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_user_path(@user), notice: "ユーザー情報を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    reset_session
    redirect_to new_user_path, notice: "退会しました"
  end

  private

  def set_user
    @user = User.find(params[:id])   # ここに追加
  end

  def require_owner
    unless @user.id == current_user.id   # ここに追加
      redirect_to user_user_path(current_user), alert: "権限がありません"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
