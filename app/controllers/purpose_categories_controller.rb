class PurposeCategoriesController < ApplicationController
  def index
    @purpose = Purpose.find(params[:purpose_id])
    @categories = Category.where(purpose_id: @purpose.id)
  end
end
