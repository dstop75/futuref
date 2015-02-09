class ResourcesController < ApplicationController
  def new
    @topics = Topic.all
    @topic = Topic.find(params[:topic_id])
    @resource = @topic.resources.new
  end

  def edit
    @resource = Resource.find(params[:id])
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

  def update
    @resource = Resource.find(params[:id])
    @topic = @resource.topic

    if @resource.update(resource_params)
      flash[:success] = 'Resource successfully updated.'
      redirect_to @topic
    else
      render :edit
    end
  end

  def destroy
    @topic = Resource.find(params[:id]).topic
    Resource.find(params[:id]).destroy
    flash[:success] = 'Comment successfully deleted.'
    redirect_to @topic
  end

  private
    def resource_params
      params.require(:resource).permit(:name, :url)
    end
end
