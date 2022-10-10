class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @comment = @lesson.comments.new new_comment_params
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @lesson, notice: 'Comment was successfully created' }
      else
        format.html { redirect_to @lesson, alert: 'There was a problem creating your comment' }
      end
    end
  end

  private

  def new_comment_params
    params.require(:comment).permit(:body)
  end
end
