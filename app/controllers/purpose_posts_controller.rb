class PurposePostsController < ApplicationController
  def index
    @purpose = Purpose.find(params[:purpose_id])
    @posts = Post.where(purpose_id: @purpose.id)
  end
end
