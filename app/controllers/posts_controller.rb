class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def search
    # 検索ロジックは後で追加
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :sub_category_id)
  end
end
