class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params.merge(purpose_id: 1))

    if @category.save

      # その他ポイントの場合のみサブカテゴリを保存
      if @category.name == "その他ポイント" && params[:sub_categories].present?
        params[:sub_categories].split("\n").each do |name|
          @category.sub_categories.create(name: name.strip)
        end
      end

      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
    # @category がセットされている
  end

  def update
    old_name = @category.name   # ここに追加：更新前のカテゴリ名を保持

    if @category.update(category_params)

      # 更新後のカテゴリ名で判定する
      if @category.name == "その他ポイント"

        if params[:sub_categories]
          @category.sub_categories.destroy_all   # ここに追加：既存サブカテゴリを削除

          params[:sub_categories].split("\n").each do |name|
            @category.sub_categories.create(name: name.strip)
          end
        end

      else
        # その他ポイント → 別カテゴリに変更した場合はサブカテゴリ削除
        if old_name == "その他ポイント"
          @category.sub_categories.destroy_all
        end
      end

      redirect_to admin_categories_path, notice: "カテゴリを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
