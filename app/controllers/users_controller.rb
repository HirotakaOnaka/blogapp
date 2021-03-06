class UsersController < ApplicationController
  before_action:set_user,only:[:edit,:update,:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id),notice:"PROFILEを編集しました"
    else
      render 'edit'
    end
  end

  def show
    @favorites_blogs = @user.favorite_blogs
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
