class PurposeCategoriesController < ApplicationController
  def index
    @purpose = Purpose.find(params[:purpose_id])
    @categories = @purpose.categories   
  end
end
