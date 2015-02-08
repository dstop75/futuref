class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topics = Topic.all
    @topic = Topic.find(params[:id])
  end

  def new
    @topics = Topic.all
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      flash[:success] = 'Topic successfully created.'
      redirect_to topics_url
    else
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update_attributes(topic_params)
      flash[:success] = 'Topic successfully updated.'
      redirect_to topic_url(@topic)
    else
      render :edit
    end
  end

  private
    def topic_params
      params.require(:topic).permit(:name)
    end
end
