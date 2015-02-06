class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_url
    else
      render 'form'
    end
  end

  private
    def topic_params
      params.require(:topic).permit(:name)
    end
end
