class Admin::BookCategoriesController < Admin::ApplicationController
  before_filter :find_book_category, :only => [:show, :destroy, :edit, :update]

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page] unless params[:page].nil?
    @book_categories = BookCategory.paginate(:page => params[:page], :per_page => 10,
                                         :order => "name" )
    @no = params[:page].nil? ? 0 : (params[:page].to_i-1) * 10
  end

  def new
    @book_category = BookCategory.new
  end

  def create
    @book_category = BookCategory.new(params[:book_category])
    if @book_category.save
      flash[:notice] = "BookCategory successfully created"
      redirect_to admin_book_categories_path
    else
      flash[:error] = "BookCategory failed to create"
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book_category.update_attributes(params[:book_category])
      flash[:notice] = "BookCategory successfully updated"
      redirect_to admin_book_categories_path
    else
      flash[:error] = "BookCategory failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @book_category.destroy ? ('BookCategory was successfully deleted.') :
                                            ('BookCategory was falied to delete.')
    redirect_to admin_book_categories_path
  end

  private
    def find_book_category
      @book_category = BookCategory.find_by_id(params[:id])
      if @book_category.nil?
        flash[:notice] = "Cannot find the BookCategory with id '#{params[:id]}'"
        redirect_to admin_book_categories_path
      end
    end
end
