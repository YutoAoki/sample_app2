class RelationshipsController < ApplicationController
  def create
    relationship = Relationship.new
    relationship.user_id = params[:user_id]
    relationship.topic_id = params[:topic_id]
    relationship.status = 2
    if relationship.save
      flash[:success] = "お墓訪問者申請が完了しました。"
      redirect_to topic_path(params[:topic_id])
    else
      flash.now[:danger] = "お墓訪問者申請に失敗しました。"
      render :show
    end

  end

  # def create
  #   mile = Mile.new
  #   mile.user_id = current_user.id
  #   mile.topic_id = params[:topic_id]
  #   if mile.save
  #     flash[:success] = "お墓参りをしました。"
  #     redirect_to topic_path(params[:topic_id])
  #   else
  #     flash.now[:danger] = "お参りをやり直してください。"
  #     render :show
  #   end
  # end



end
