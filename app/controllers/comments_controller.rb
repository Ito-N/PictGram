class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_params)
    @comment.topic_id = params[:topic_id]
    @comment.user_id = current_user.id
    
    if @comment.save
      redirect_to topics_path, success: "コメント投稿しました"
    else
      flash[:danger] =  "コメント投稿に失敗しました"
      render :new
      #@topic = Topic.find(comment_params[:topic_id])
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
  
end
