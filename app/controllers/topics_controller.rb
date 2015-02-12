class TopicsController < ApplicationController
  before_action :set_topics, only: [:index, :show, :new]
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      flash[:success] = 'Topic successfully created.'
      redirect_to @topic
    else
      render :new
    end
  end

  def update

    if @topic.update_attributes(topic_params)
      flash[:success] = 'Topic successfully updated.'
      redirect_to @topic
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    flash[:success] = 'Topic successfully deleted.'
    redirect_to action: :index
  end

  private
    def set_topics
      @topics = Topic.all
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:name)
    end
end
