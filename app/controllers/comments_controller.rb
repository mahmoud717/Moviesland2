class CommentsController < ApplicationController
  before_action :logged?
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    @comment.user = User.find_by(id: session['current_user']['id'])

    if @comment.save
      redirect_to article_path(params[:article_id]), notice: 'Comment was successfully created.'
    else
      flash.alert = @comment.errors.full_messages
      redirect_to articles_path, alert: @comment.errors.full_messages.join('. ').to_s
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def logged?
    if session.key?('current_user')
      true
    else
      redirect_to(login_path, notice: 'you have to be logged in before you can vote any article.')
    end
  end
end
