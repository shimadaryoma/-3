class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user, only: [:edit, :update]
  def show
    @user=User.find(params[:id])
    @books=@user.books
    @book=Book.new
  end

  def edit
    @user= current_user
  end

  def index
    @user= current_user
    @book=Book.new
    @users=User.all
  end

  def update
   @user=User.find(params[:id])
   if @user.update(user_params)
     redirect_to user_path(@user), notice: "You have updated user successfully."
   else
     render:edit
   end
  end

  private
  def user_params
      params.require(:user).permit(:profile_image, :name, :introduction)
  end

  def ensure_user
    @user=User.find(params[:id])
    if current_user.id!=@user.id
      redirect_to user_path(current_user.id)
    end
  end
end
