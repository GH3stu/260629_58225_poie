class SearchController < ApplicationController
  def index
    # （検索対象の判定）
    @keyword = params[:keyword]
    @target  = params[:target]  # "users" or "posts"

    if @keyword.present?
      case @target
      when "users"
        # （ユーザー検索）
        @results = User.where("name LIKE ?", "%#{@keyword}%")
      when "posts"
        # （投稿検索）
        @results = Post.where("title LIKE ? OR body LIKE ?", "%#{@keyword}%", "%#{@keyword}%")
      else
        @results = []
      end
    else
      @results = []
    end
  end
end
