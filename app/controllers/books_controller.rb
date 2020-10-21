class BooksController < ApplicationController
  def top
  end


  def new
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @profile_images = ProfileImage.all
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
  end

  def index
    @user = User.find(params[:id])
    @book = Book.new
    @profile_images = ProfileImage.all
    @books = Book.all
  end

  def destroy
    @book = book.find(params[:id])
    @book.destroy
    redirect_to user_book_index
  end

 def edit
   @book = Book.find(params[:id])
 end

 def update
   @book = book.find(params[:id])
   @book.update(book_params)
   redirect_to user_book_path(@book.id)
 end


 private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end

end
