class SessionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :new]

  def new
  end


  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'メールアドレス・パスワードが正しくありません。'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  private
    def logged_in_user
      if logged_in?
        flash[:danger] = "すでにログインしています。"
        redirect_to user_path(current_user)
      end
    end

end
