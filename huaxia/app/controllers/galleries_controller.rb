class GalleriesController < ApplicationController

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page]
    @categories = Category.paginate(:page => params[:page], :per_page => 9,
                                         :order => "created_at DESC" )
  end

  def show
    @category = Category.find_by_permalink(params[:permalink])
    if @category.nil?
      @category = Category.first
      flash[:error] = "Cannot find gallery with type '#{params[:permalink].titleize}'"
    end
    @images = @category.galleries
  end
end
