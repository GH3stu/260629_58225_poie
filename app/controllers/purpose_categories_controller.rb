class PurposeCategoriesController < ApplicationController
  def index
    @purpose = Purpose.find(params[:purpose_id])
    categories = @purpose.sub_categories.includes(:category).map(&:category)
    @categories = categories.uniq { |c| c.name }
                           .sort_by { |c| Category::ORDER_NAMES.index(c.name) }
  end
end
