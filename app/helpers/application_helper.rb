module ApplicationHelper
  def logged?
    session.key?('current_user') ? true : false
  end

  def admin?
    return true if session['current_user']['admin'] == true
  end

  def user?(user_id)
    return true if user_id == session['current_user']['id']
  end

  def user_admin?(user_id)
    return true if user?(user_id) || admin?
  end
end
