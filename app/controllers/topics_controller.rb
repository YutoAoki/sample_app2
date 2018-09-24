class TopicsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :index, :show]
  before_action :owner_user, only: [:edit, :update, :users_index]

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      new_relationship(@topic.id)
      flash[:success] = "お墓の新規登録が完了しました。"
      redirect_to topic_path(@topic)

    else
      flash.now[:danger] = "お墓の新規登録に失敗しました。"
      render :new
    end
  end

  def show
    @comment = Comment.new
    @topic = Topic.find_by(id: params[:id])
    @owner = User.find_by(id: @topic.user_id)
    @miles = Mile.where(topic_id: params[:id]).limit(10)

    @comments = @topic.comments.limit(5)
    # @miles = Mile.find_by(topic_id: params[:id])
    # https://qiita.com/tsuchinoko_run/items/f3926caaec461cfa1ca3
    # find_byは最初の一つしか取り出さないので、each文でエラーになる。whereで配列として取り出す必要がある「。

  end

  def index
    @notice = ""
    # https://stackoverflow.com/questions/22159426/ransack-start-with-blank-index-no-results
    if params[:q] && params[:q].reject { |k, v| v.nil? }.present?
      @search = Topic.search(params[:q])
      @result = @search.result
      if @result.count != 1
        @notice = "正しいお墓IDを入力してください。"
        return false
      end
    else
      @search = Topic.search
      @result = []
    end

  end

  def edit
    # @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(topic_params)
      flash[:success] = "お墓の更新に成功しました。"
      redirect_to @topic
    else
      render 'edit'
    end
  end

  def users_index
    @topic = Topic.find(params[:id])
    @topic_users = Topic.find(params[:id]).users
  end

  private
    def topic_params
        params.require(:topic).permit(:topic_name, :topic_search_id,
                                      :topic_image, :topic_bio)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください。"
        redirect_to login_path
      end
    end

    def new_relationship(relation_topic_id)
      @relationship = Relationship.new(user_id: current_user.id, topic_id: relation_topic_id ,status: 0, owner_id: current_user.id)
      @relationship.save
    end

    def owner_user
      @topic = Topic.find(params[:id])
      unless @topic.user_id == current_user.id
        flash[:danger] = "管理者のみが入れます。"
        redirect_to user_path(current_user)
      end
    end


end



    #   <%= f.label :topic_name, "お墓の名前" %>
    #   <%= f.text_field :topic_name, class: 'form-control' %>
    #
    #   <%= f.label :topic_search_id, " お墓のID（英数字）" %>
    #   <%= f.text_field :topic_search_id, class: 'form-control' %>
    #
    #   <%= f.label :topic_image, "お墓の写真(遺影)" %>
    #   <%= f.file_field :topic_image, class: 'form-group' %>
    #
    #   <%= f.label :topic_bio, " お墓の説明" %>
    #   <%= f.text_area :topic_bio, class: 'form-control' %>
    #
    #   <%= f.submit "新規お墓登録", class: "btn btn-primary" %>
    # <% end %>
