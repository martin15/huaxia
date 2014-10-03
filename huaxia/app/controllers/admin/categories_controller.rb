class Admin::CategoriesController < Admin::ApplicationController
  before_filter :find_category, :only => [:edit, :update, :destroy]

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page] unless params[:page].nil?
    @categories = Category.includes("galleries").
                                paginate(:page => params[:page], :per_page => 12,
                                         :order => "created_at DESC" )
  end

  def new
    @category = Category.new
  end

  def create
    # create a new category_picture
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Gallery successfully created"
      redirect_to admin_gallery_categories_path
    else
      flash[:error] = "Gallery failed to create<br />Pleace choose the Image"
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(params[:category])
      flash[:notice] = "Gallery successfully updated"
      redirect_to admin_gallery_categories_path
    else
      flash[:error] = "Gallery failed to update<br />Pleace choose the Image"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @category.destroy ? 'Category was successfully deleted.' :
                                          'Category was falied to delete.'
    redirect_to admin_gallery_categories_path
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
