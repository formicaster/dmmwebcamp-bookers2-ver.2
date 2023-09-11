class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :check_author, only: [:edit, :update, :destroy]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    if @book.save
      flash[:notice] = 'You have created book successfully.'
      redirect_to book_path(@book)
    else
      @books = Book.all
      render 'index'
    end
  end

  def index
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
      return
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'You have updated book successfully.'
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :image, :body, :user_id)
  end

  def check_author
    unless @book.user == current_user
      redirect_to books_path
    end
  end
end
