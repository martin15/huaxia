class Admin::CategoriesController < Admin::ApplicationController
  before_filter :find_category, :only => [:edit, :update]

  def index
    @categories = Category.includes("galleries").
                                paginate(:page => params[:page], :per_page => 10,
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
