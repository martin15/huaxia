class BooksController < ApplicationController

  def index
    @books = Book.paginate(:page => params[:page], :per_page => 9,
                                         :order => "created_at DESC" )
  end

  def show
    @book = Book.find_by_permalink(params[:permalink])
    if @book.nil?
      redirect_to books_path
    end
  end
end
