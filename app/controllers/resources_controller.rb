class ResourcesController < ApplicationController
  before_action :set_topic, only: [:new, :create]
  before_action :set_resource, only: [:edit, :update, :destroy]

  def new
    @topics = Topic.all
    @resource = @topic.resources.new
  end

  def edit
  end

  def create
    @resource = @topic.resources.new(resource_params)

    if @resource.save
      flash[:success] = 'Link successfully created.'
      redirect_to @topic
    else
      render :new
    end
  end

  def update
    topic = @resource.topic

    if @resource.update(resource_params)
      flash[:success] = 'Link successfully updated.'
      redirect_to topic
    else
      render :edit
    end
  end

  def destroy
    topic = @resource.topic
    @resource.destroy

    flash[:success] = 'Link successfully deleted.'

    redirect_to topic
  end

  private
    def set_resource
      @resource = Resource.find(params[:id])
    end

    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    def resource_params
      params.require(:resource).permit(:name, :url)
    end
end
