class GalleriesController < ApplicationController

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page]
    @categories =Category.where("category_type = '#{params[:type]}'")
    if @categories.nil?
      redirect_to root_path
      return
    end
    @categories = @categories.paginate(:page => params[:page], :per_page => 30,
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
