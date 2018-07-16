class MilesController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    mile = Mile.new
    mile.user_id = current_user.id
    mile.topic_id = params[:topic_id]
    if mile.save
      flash[:success] = "お墓参りをしました。"
      redirect_to topic_path(params[:topic_id])
    else
      flash.now[:danger] = "お参りをやり直してください。"
      render :show
    end
  end

  private
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください。"
        redirect_to login_path
      end
    end

end
