class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        @books = Book.find(current_user.id)
        @user = current_user
        @book = Book.new
    end
    def edit
	    @user = User.find(params[:id])
    end
    def update
    	user = User.find(params[:id])
    	user.update(user_params)
    	redirect_to books_path
    end
     def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end
end
