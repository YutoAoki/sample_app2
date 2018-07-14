class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      flash[:success] = "お墓の新規登録が完了しました。"
      redirect_to topic_path(@topic)
    else
      flash.now[:danger] = "お墓の新規登録に失敗しました。"
      render :new
    end
  end

  def show
    @topic = Topic.find_by(id: params[:id])
    @owner = User.find_by(id: @topic.user_id)
    @miles = Mile.where(topic_id: params[:id]).limit(10)
    # @miles = Mile.find_by(topic_id: params[:id])
    # https://qiita.com/tsuchinoko_run/items/f3926caaec461cfa1ca3
    # find_byは最初の一つしか取り出さないので、each文でエラーになる。whereで配列として取り出す必要がある「。
  end

  private
    def topic_params
        params.require(:topic).permit(:topic_name, :topic_search_id,
                                      :topic_image, :topic_bio)


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
