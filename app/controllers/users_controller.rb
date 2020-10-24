class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if
     @user.update(user_params)
     redirect_to user_path(current_user), notice: "You have updated successfully."
   else
     flash.now[:alert] = "You failed to update. Please try again."
     render :new
   end
  end

  def index
    @users = User.all
    @book = Book.new
  end

  private

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to root_path
    end
  end


  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end