class SearchController < ApplicationController
  def index
    # （検索対象の判定）
    @keyword = params[:keyword]
    @target  = params[:target].presence || "posts"  # 未指定なら投稿検索
    @match   = params[:match].presence || "partial"   # 完全一致を追加

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
