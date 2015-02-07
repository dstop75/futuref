class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @topic = Topic.new
  end

  def new
    # @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      flash[:success] = 'Topic successfully created.'
    else
      flash[:error] = 'Topic not saved - please try again.'
    end
      redirect_to topics_url
  end

  private
    def topic_params
      params.require(:topic).permit(:name)
    end
end
