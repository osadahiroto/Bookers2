class BooksController < ApplicationController



  def new
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice]= 'You have updated user successfully.'
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
    @user = @book.user
    @book_new = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @user = @book.user
    if @user.id == current_user.id

    @book.destroy
    end
    redirect_to books_path

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice]= 'You have updated book successfully.'
    redirect_to book_path(@book.id)
    else
    render :edit
    end
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
    if @user.id == current_user.id

    else
    redirect_to books_path
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
