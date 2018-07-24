class UsersController < ApplicationController
  before_action :new_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @topics = @user.topics

    @non = Relationship.where(user_id: current_user.id).topics
    a
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "会員登録が完了しました！ようこそHAKAMILEへ！"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def new_user
      if logged_in?
        flash[:danger] = "すでにログインしています。"
        redirect_to user_path(current_user)
      end
    end

end
