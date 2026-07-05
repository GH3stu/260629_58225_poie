# ・app/controllers/posts_controller.rb
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def search
    # 検索ロジックは後で追加
  end
end
