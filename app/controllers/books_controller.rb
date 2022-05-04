class BooksController < ApplicationController
    before_action :correct_user, only: [:edit, :update, :destroy]

    def new
     @book = Book.new
     @post_book.user_id = current_user.id
    end

   def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

     if @book.save
     redirect_to book_path(@book.id)
     flash[:alert] = "You have created book successfully."


     else
      @user = current_user
      @books = Book.all
      render :index

     end
   end



  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @post_book = @user.books

  end

  def show
    @books = Book.find(params[:id])
    @new_book = Book.new
    @user = @books.user
  end

  def edit
      @book= Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])

      if @book.update(book_params)

      redirect_to book_path(book_params)
      flash[:alert] = "You have updated book successfully."

      else
      render :edit
      end
  end

def destroy
    @books= Book.find(params[:id])
    @user = current_user
    @books.destroy
    redirect_to books_path
end

private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

end