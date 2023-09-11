class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Signed in successfully.'
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end
end