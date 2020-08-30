class BooksController < ApplicationController
	before_action :authenticate_user!
	def create
		@newbook = Book.new(book_params)
		@books = Book.all
		@user =  current_user
		@newbook.user_id = @user.id
    	if @newbook.save
      	redirect_to book_path(@newbook),notice: 'Book was successfully created.'
    	else
      	render :index
    	end
	end

	def index
		@newbook = Book.new
		@books = Book.all
		@user =  current_user
		
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
		@newbook = Book.new
		@books = @user.books

	end

	def edit
    	@book = Book.find(params[:id])
    	unless 	@book.user_id == current_user.id
			redirect_to books_path
		end
  	end

	def update
    	@book = Book.find(params[:id])
    	@book.update(book_params)
    	if @book.save
    	redirect_to book_path(@book), notice: "You have updated book successfully."
    	else
    		render "edit"
    	end
	end

 	def destroy
 		@book = Book.find(params[:id])
   		@book.destroy
    	redirect_to @book, notice: 'Book was successfully destroyed.'
 	end

	private
	def book_params
		params.require(:book).permit(:title, :body, :user_id)
	end
end
