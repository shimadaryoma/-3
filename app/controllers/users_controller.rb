class UsersController < ApplicationController
  def show
  end

  def edit
    @user= current_user
  end
  
  def index
  end
end
