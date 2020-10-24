class BooksController < ApplicationController


  def show
    @book = Book.new
    @book_show = Book.find(params[:id])
    @user =  @book_show.user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.user_id)
  end

  def index

    @books = Book.all
    @book = Book.new

  end

  def destroy
    @book = book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end

 def edit
   @book = Book.find(params[:id])
 end

 def update
   @book = Book.find(params[:id])
   @book.update(book_params)
   redirect_to book_path(@book.id)
 end


 private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
