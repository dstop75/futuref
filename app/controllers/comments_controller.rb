class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def edit
    @resource = @comment.resource
  end

  def create
    @resource = Resource.find(params[:resource_id])
    @comment = @resource.comments.new(comment_params)

    flash[:success] = 'Comment successfully created.' if @comment.save

    redirect_to @resource.topic
  end

  def update
    @resource = @comment.resource
    @topic = @resource.topic

    flash[:success] = 'Comment successfully updated.' if @comment.update(comment_params)

    redirect_to @topic
  end

  def destroy
    @topic = @comment.resource.topic
    @comment.destroy
    flash[:success] = 'Comment successfully deleted.'
    redirect_to @topic
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:message)
    end
end
