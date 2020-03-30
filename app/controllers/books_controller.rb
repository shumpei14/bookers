class BooksController < ApplicationController
    before_action :authenticate_user!
	def index
		@books = Book.all
        @book = Book.new
        @user = User.find(current_user.id)
    end

    def show
        @book = Book.find(params[:id])
        @user = User.find(current_user.id)
    end
    def edit
        @book = Book.find(params[:id])
        if current_user != @book.user
        redirect_to books_path
    end

    end
    def destroy
        book = Book.find(params[:id])
        if book.destroy
        redirect_to books_path
    end
    end

    def create
    	book = Book.new(book_params)
        book.user_id = current_user.id
        # book = current_user.books.build(book_params)
    	if book.save
            flash[:notice] = "Book was successfully created"
        	redirect_to book_path(book.id)
        else
            @user = User.find(current_user.id)
            flash[:notice] = "error"
            @books = Book.all
            @book=book
            render :index
        end
    end
    def update
        book = Book.find(params[:id])
        book.update(book_params)
        if book.save
        flash[:notice] = "You have updated book successfully."
        redirect_to book_path(book.id)
    end
    end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end

