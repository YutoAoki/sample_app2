class RelationshipsController < ApplicationController
  def create
    relationship = Relationship.new
    relationship.user_id = params[:user_id]
    topic = Topic.find(params[:topic_id])
    relationship.topic_id = params[:topic_id]
    relationship.status = 2
    relationship.owner_id = topic.user_id
    if relationship.save
      flash[:success] = "お墓訪問者申請が完了しました。"
      redirect_to topic_path(params[:topic_id])
    else
      flash.now[:danger] = "お墓訪問者申請に失敗しました。"
      render :show
    end
  end

  def update
    @relationship = Relationship.find_by_user_id_and_topic_id(params[:user_id], params[:topic_id])
    @relationship.status = 1
    @relationship.save
    flash[:success] = "#{@relationship.user.name}さんのお墓訪問申請を承認しました。"
    redirect_to user_path(current_user)
  end

  def destroy
    @relationship = Relationship.find_by_user_id_and_topic_id(params[:user_id], params[:topic_id])
    @relationship.delete
    flash[:danger] = "#{@relationship.user.name}さんのお墓訪問申請を却下しました。"
    redirect_to user_path(current_user)
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
