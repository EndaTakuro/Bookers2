class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
  	@books = Book.all
  	@user = current_user
  	@book = Book.new
  end

  def show
  	@user = Book.find(params[:id]).user
  	@nbook = Book.new
    @book = Book.find(params[:id])
  end

  def create
  	@books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @user = current_user
      render :index
    end
  end

  def edit
  	@book = Book.find(params[:id])
  	if @book.user != current_user
  		redirect_to books_path
  	end
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  	  flash[:notice] = "You have updated book successfully."
  	  redirect_to book_path(@book)
  	  else
      render :edit
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


  def book_params
    params.require(:book).permit(:user_id, :title, :body)
  end
end
