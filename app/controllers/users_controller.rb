class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.new(user_params)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @user_index =  @book.user
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end