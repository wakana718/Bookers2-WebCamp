class BooksController < ApplicationController
  def top
  end


  def new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @profile_images = ProfileImage.all
    @books = Book.all
  end

  def create
  end

  def index
    @user = User.find(params[:id])
    @book = Book.new
    @profile_images = ProfileImage.all
    @books = Book.all
  end


end
