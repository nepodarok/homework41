class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = 'YES'
      redirect_to :back
    else
      flash[:error] = 'nope'
      redirect_to :back
    end
  end


    private

    def comment_params
      params.require(:comment).permit(:content, :photo_id)
    end

end
