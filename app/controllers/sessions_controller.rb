class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to blogs_path(user.id)
    else
      flash.now[:danger] = "ログインに失敗しました。再試行してください。"
      render 'new'
    end
  end
  
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to root_path
  end
end
