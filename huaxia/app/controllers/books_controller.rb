class BooksController < ApplicationController

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page]
    @books = Book.where("book_type = '#{params[:book_type]}'").
                  paginate(:page => params[:page], :per_page => 9,
                                         :order => "created_at DESC" )
    bl = Book.list_type.map{|type| type[1]}
    @book_type = params[:book_type]
    unless bl.include?(@book_type)
      redirect_to root_path
      return
    end
    @book_note = Information.find_by_permalink("book_note")
  end

  def show
    @book = Book.find_by_permalink(params[:permalink])
    if @book.nil?
      redirect_to books_path
    end
    @book_note = Information.find_by_permalink("book_note")
  end
end
