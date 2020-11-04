class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = BookComment.new(book_comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = @book.id

    if @comment.save
    redirect_to book_path(params[:book_id])
    else
    redirect_to book_path(params[:book_id])
    end
  end

  def destroy
    @a = BookComment.find(params[:book_id])
    @a.destroy
    redirect_to request.referer
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
