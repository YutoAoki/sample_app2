class StaticPagesController < ApplicationController
  def home
    @user = current_user
    if logged_in?
      @topics = @user.topics

      @non_approved = Relationship.where(["owner_id = ? and status = ?", current_user.id, 2])
      @approved = Relationship.where(["user_id = ? and status = ?", @user.id, 1])
    end
  end

  def help
  end

  def about
  end

  def omikuji
  end
end
