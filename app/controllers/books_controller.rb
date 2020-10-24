class BooksController < ApplicationController
 before_action :authenticate_user!

  def show
    @book = Book.new
    @book_show = Book.find(params[:id])
    @user =  @book_show.user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       redirect_to book_path(@book.user_id), notice: "You have created successfully."
    else
       flash.now[:alert] = "You failed to create. Please try again."
       render :new
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def destroy
    @book = book.find(params[:id])
    @book.destroy
    redirect_to book_path, notice: "successfully destroyed."
  end

 def edit
   @book = Book.find(params[:id])
 end

 def update
   @book = Book.find(params[:id])
  if
   @book.update(book_params)
   redirect_to book_path(@book.id), notice: "You have updated successfully."
  else
   flash.now[:alert] = "You failed to update. Please try again."
   render :edit
  end
 end


 private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
