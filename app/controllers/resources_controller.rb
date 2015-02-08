class ResourcesController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @resource = @topic.resources.new
  end

end
