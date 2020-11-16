class VotesController < ApplicationController
  before_action :logged?

  def create
    @article = Article.find(params[:article_id])
    user = User.find_by(id: session['current_user']['id'])
    Vote.create(user_id: user.id, article_id: @article.id)
    @article.vote_counter += 1
    @article.save
    redirect_back fallback_location: root_path
  end

  def destroy
    article = Article.find(params[:article_id])

    user = User.find_by(id: session['current_user']['id'])
    vote = Vote.find_by(user_id: user.id, article_id: article.id)

    if vote
      vote.destroy
      article.vote_counter -= 1
      article.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path, notice: "you didn't vote this article")
    end
  end

  private

  def logged?
    session.key?('current_user') ? true : redirect_to(login_path)
  end
end
