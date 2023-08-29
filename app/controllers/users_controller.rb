class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
  end
end
