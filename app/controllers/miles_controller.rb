class MilesController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    mile = Mile.new
    mile.user_id = current_user.id
    mile.topic_id = params[:topic_id]
    if mile.save
      flash[:success] = "お墓参りをしました。"
      sleep(5)
      redirect_to topic_path(params[:topic_id])
    else
      flash.now[:danger] = "お参りをやり直してください。"
      render :show
    end
  end

  def show
    @miles_where = Mile.where(topic_id: params[:id])
    @miles = @miles_where.paginate(page: params[:page], per_page: 10)


  end

  private
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください。"
        redirect_to login_path
      end
    end

end
