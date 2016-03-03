class BooksController < ApplicationController
  before_filter :find_book_category, :only => [:index, :show]

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page]
    if @book_category.permalink.downcase.include?("diskon") ||
       @book_category.permalink.downcase.include?("discount") ||
       @book_category.permalink.downcase.include?("promo")
      @books = Book.discount_book
    else
      @books = @book_category.books
    end
    @books = @books.paginate(:page => params[:page], :per_page => 12, :order => "created_at DESC" )
    @book_note = Information.find_by_permalink("book_note")
  end

  def show
    @book = @book_category.books.find_by_permalink(params[:permalink])
    if @book.nil?
      redirect_to books_path
    end
    @book_note = Information.find_by_permalink("book_note")
  end

  private
    def find_book_category
      @book_category = BookCategory.find_by_permalink(params[:book_type])
      if @book_category.nil?
        flash[:notice] = "Cannot find book the Category with id '#{params[:book_type]}'"
        redirect_to root_path
      end
    end
end
