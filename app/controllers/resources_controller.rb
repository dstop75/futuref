class ResourcesController < ApplicationController
  def new
    @topics = Topic.all
    @topic = Topic.find(params[:topic_id])
    @resource = @topic.resources.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @resource = @topic.resources.new(resource_params)

    if @resource.save
      flash[:success] = 'Resource successfully created.'
      redirect_to @topic
    else
      render :new
    end
  end

  private
    def resource_params
      params.require(:resource).permit(:name, :url)
    end
end
