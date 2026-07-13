class PurposeCategoriesController < ApplicationController
  def index
    @purpose = Purpose.find(params[:purpose_id])
    @categories = @purpose.categories.order(:name)
  end
end
