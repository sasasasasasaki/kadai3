class UsersController < ApplicationController
  def new
     @post_book = PostBook.new
     @post_book.user_id = current_user.id
  end

def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

     if @book.save
     redirect_to book_path(@book.id)
     flash[:alert] = "Book was successfully created."


     else
      @books = Book.all
      render :index

     end
end

  def index
    @new_book = Book.new
    @user = current_user
    @users = User.all
    @books = Book.all

  end

  def show
    @user2 = current_user
    @users = User.all
    @user = User.find(params[:id])
    @post_book = @user.books
    @new_book = Book.new
  end

  def edit

     @user = User.find(params[:id])

     if current_user == @user
      render :edit
     else
      redirect_to user_path(current_user)

     end
  end

  def update
     @user = User.find(params[:id])

      if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:alert] = "You have updated user successfully."

      else
      render :edit

      end
  end

  def destroy
    @post_book = Book.find(params[:id])
    @post_book.destroy
    redirect_to user_path(current_user)
  end


  def user_params
    params.require(:user).permit(:introduction,:name,:profile_image)

  end
end