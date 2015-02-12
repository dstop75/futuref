class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_topic, only: [:update, :destroy]

  def edit
    @resource = @comment.resource
  end

  def create
    resource = Resource.find(params[:resource_id])
    @comment = resource.comments.new(comment_params)

    flash[:success] = 'Comment successfully created.' if @comment.save

    redirect_to resource.topic
  end

  def update
    flash[:success] = 'Comment successfully updated.' if @comment.update(comment_params)

    redirect_to @topic
  end

  def destroy
    flash[:success] = 'Comment successfully deleted.' if @comment.destroy

    redirect_to @topic
  end

  private
    def set_topic
      @topic = @comment.resource.topic
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:message)
    end
end
