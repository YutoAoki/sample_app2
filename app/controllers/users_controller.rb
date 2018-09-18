class UsersController < ApplicationController
  before_action :new_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @topics = @user.topics

    # @non = Relationship.where(user_id: current_user.id).topics
    # @non_approved = Relationship.find_by_topic_id_and_owner_id(21, 2)
    # @non_approved = Relationship.find_by_owner_id_and_status(current_user.id, 2).topic
    @non_approved = Relationship.where(["owner_id = ? and status = ?", current_user.id, 2])
    @approved = Relationship.where(["user_id = ? and status = ?", @user.id, 1])

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
