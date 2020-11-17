module ApplicationHelper
  def logged?
    session.key?('current_user') ? true : false
  end

  def admin?
    return true if logged? && session['current_user']['admin'] == true
  end

  def user?(user_id)
    return true if logged? && user_id == session['current_user']['id']
  end

  def user_admin?(user_id)
    return true if user?(user_id) || admin?
  end

  def vote_button(article)
    @vote = Vote.find_by(user_id: session['current_user']['id'], article_id: article.id) if article && logged?
    @vote = Vote.find_by(user_id: session['current_user']['id'], article_id: article.id) if @article && logged?
    if logged? && @vote
      "<div class='vote_container d-flex flex-row mr-2 '>
        <div class='current_votes d-flex mr-3'>
          <div class='my-auto'>#{article.vote_counter}</div>
          <div class='ml-1 my-auto text-center'>Votes</div>
        </div>
        #{link_to 'Unvote', unvote_path(article), class: 'btn btn-danger'}
        </div>".html_safe
    else
      "<div class='vote_container d-flex flex-row mr-2 '>
        <div class='current_votes d-flex mr-3'>
          <div class='my-auto'>#{article.vote_counter}</div>
          <div class='ml-1 my-auto text-center'>Votes</div>
        </div>
        #{link_to 'Vote', vote_path(article), class: 'btn btn-warning'}
        </div>".html_safe

    end
  end
end
