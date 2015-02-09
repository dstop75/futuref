class CommentsController < ApplicationController
  # def new
  #   @resource = Resource.find(params[:resource_id])
  #   @comment = @resource.comments.new
  # end

  def edit
    @comment = Comment.find(params[:id])
    @resource = @comment.resource
  end

  def create
    @resource = Resource.find(params[:resource_id])
    @comment = @resource.comments.new(comment_params)

    flash[:success] = 'Comment successfully created.' if @comment.save

    redirect_to @resource.topic
  end

  def update
    @comment = Comment.find(params[:id])
    @resource = @comment.resource
    @topic = @resource.topic

    flash[:success] = 'Comment successfully updated.' if @comment.update(comment_params)

    redirect_to @topic
  end

  def destroy
    @topic = Comment.find(params[:id]).resource.topic
    Comment.find(params[:id]).destroy
    flash[:success] = 'Comment successfully deleted.'
    redirect_to @topic
  end

  private
    def comment_params
      params.require(:comment).permit(:message)
    end
end
