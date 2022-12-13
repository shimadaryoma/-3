class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user, only: [:edit]
  def new
    @book=Book.new
  end

  def index
    @books=Book.all
    @user=current_user
    @book=Book.new
  end

  def show
    @book=Book.find(params[:id])
    @user=@book.user
    @book1=Book.new
  end

  def edit
    @book=Book.find(params[:id])
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books=Book.all
      @user=current_user
      render:index, noitce: "An error occurred"
    end
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render:edit, noitce: "An error occurred"
    end
  end





  private
  def book_params
      params.require(:book).permit(:title, :body)
  end
  def user_params
      params.require(:user).permit(:profile_image, :name, :introduction)
  end

  def ensure_user
    @book=Book.find(params[:id])
    @user=User.find(@book.user.id)
    if current_user.id!=@user.id
      redirect_to books_path
    end
  end

end
