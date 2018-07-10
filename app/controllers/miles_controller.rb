class MilesController < ApplicationController
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
end
