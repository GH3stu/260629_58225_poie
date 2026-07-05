# ・app/controllers/user/relationships_controller.rb
class User::RelationshipsController < ApplicationController
  before_action :require_login

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user_user_path(user), notice: "フォローしました"
  end

  def destroy
    relationship = current_user.active_relationships.find(params[:id])
    user = relationship.followed
    relationship.destroy
    redirect_to user_user_path(user), notice: "フォローを解除しました"
  end
end
