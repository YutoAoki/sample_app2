class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :index, :show]

  def create
    topic = Topic.find_by(id: params[:id])
    @comment = topic.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "記帳の投稿が完了しました。"
      redirect_to topic_path(params[:id])
    else
      flash[:danger] = "記帳の投稿に失敗しました。"
      # render :show
      redirect_to topic_path(params[:id])
    end
  end

  def new
    @comment = Comment.new
  end

  def show
    @comments_where = Comment.where(topic_id: params[:id])
    @comments = @comments_where.paginate(page: params[:page], per_page: 5)
  end


  private
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください。"
        redirect_to login_path
      end
    end


    def comment_params
        params.require(:comment).permit(:comment_image, :contents)
    end



end
