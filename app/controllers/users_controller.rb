class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
     render "edit"
    else
     redirect_to user_path(current_user.id)
    end
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
   else
    render 'users/edit'
   end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
