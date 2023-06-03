class UsersController < ApplicationController
  


  def index
     
     @user = current_user
     @users = User.all
     @book = Book.new
     @books = Book.all
     
  end

  def show
   @user = User.find(params[:id])
   
   @books = @user.books
   @newbook = Book.new
  

  end

  def edit
      
    @user = User.find(params[:id])
  unless @user.id == current_user.id
    redirect_to user_path(current_user.id)
  end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(current_user.id)
    else
       @books = Book.all
      render :edit
    end
  end

def create
    @user = User.new(user_params)
     @user_id = current_user.id
    if @user.save
       flash[:notice] = "You have updated user successfully."
    redirect_to  book_path(@book.id)
    else
       @user = current_user
       @books = Book.all
      render :index
    end
end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, )
  end
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
