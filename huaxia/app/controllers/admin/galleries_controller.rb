class Admin::GalleriesController < Admin::ApplicationController
  before_filter :find_category, :only => [:index, :new, :create, :edit, :update, :destroy]
  before_filter :find_gallery, :only => [:destroy, :edit, :update]

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page]
    @galleries = @category.galleries.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @gallery = Gallery.new
  end

  def create
    # create a new category_picture
    @gallery = @category.galleries.new(params[:gallery])
    if @gallery.save
      flash[:notice] = "Image successfully created"
    else
      flash[:error] = "Image failed to create<br />Pleace choose the Image"
    end
    redirect_to admin_galleries_path(@category.id)
  end

  def edit
  end

  def update
    if @gallery.update_attributes(params[:gallery])
      flash[:notice] = "Image successfully updated"
      redirect_to admin_galleries_path(@category.id)
    else
      flash[:error] = "Image failed to update<br />Pleace choose the Image"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @gallery.destroy ? 'Image was successfully deleted.' : 'Image was falied to delete.'
    redirect_to admin_galleries_path(@category.id)
  end

  private
    def find_category
      @category = Category.find_by_id(params[:category_id])
      if @category.nil?
        flash[:notice] = "Cannot find the Category with id '#{params[:category_id]}'"
        redirect_to admin_categories_path
      end
    end

    def find_gallery
      @gallery = Gallery.find_by_id_and_category_id(params[:id], params[:category_id])
      if @gallery.nil?
        flash[:notice] = "Cannot find the Image with id '#{params[:id]}'"
        redirect_to admin_galleries_path(@category.id)
      end
    end
end
