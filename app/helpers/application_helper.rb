module ApplicationHelper
  def default_path(user)
    return new_session_path if current_user.nil?
    
    case user.user_type
    when User::USER_TYPE[:user] then
      clients_path
    else
      new_session_path
    end
  end
end
