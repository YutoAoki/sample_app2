module TopicsHelper
  def your_status
    if your_status?
      @your_status = Relationship.where(user_id: current_user.id).find_by(topic_id: params[:id])
    end
  end


  def your_status?
    @your_status = Relationship.where(user_id: current_user.id).find_by(topic_id: params[:id])
  end

end
