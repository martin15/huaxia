class Admin::BooksController < Admin::ApplicationController
  before_filter :find_book, :only => [:show, :destroy, :edit, :update]

  def index
    @books = Book.paginate(:page => params[:page], :per_page => 5,
                                         :order => "created_at DESC" )
    @no = params[:page].to_i * 5
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      flash[:notice] = "Book successfully created"
      redirect_to admin_books_path
    else
      flash[:error] = "Book failed to create<br />Pleace choose the Image"
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update_attributes(params[:book])
      flash[:notice] = "Book successfully updated"
      redirect_to admin_books_path
    else
      flash[:error] = "Book failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @book.destroy ? ('Book was successfully deleted.') :
                                            ('Book was falied to delete.')
    redirect_to admin_books_path
  end

  private
    def find_book
      @book = Book.find_by_id(params[:id])
      if @book.nil?
        flash[:notice] = "Cannot find the Book with id '#{params[:id]}'"
        redirect_to admin_books_path
      end
    end
end
