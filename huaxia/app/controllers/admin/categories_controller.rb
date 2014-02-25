class Admin::CategoriesController < Admin::ApplicationController
  before_filter :find_category, :only => [:edit, :update]

  def index
    @categories = Category.includes("galleries")
  end

  def edit
  end

  def update
    if @category.update_attributes(params[:category])
      flash[:notice] = "Image successfully updated"
      redirect_to admin_gallery_categories_path
    else
      flash[:error] = "Image failed to update<br />Pleace choose the Image"
      render :action => "edit"
    end
  end

  private
    def find_category
      @category = Category.find_by_id(params[:id])
      if @category.nil?
        flash[:notice] = "Cannot find the Category with id '#{params[:id]}'"
        redirect_to admin_gallery_categories_path
      end
    end
end
