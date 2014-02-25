class GalleriesController < ApplicationController

  def show
    @category = Category.find_by_title(params[:title])
    if @category.nil?
      @category = Category.first
      flash[:error] = "Cannot find gallery with type '#{params[:title].titleize}'"
    end
    @images = @category.galleries
  end
end
