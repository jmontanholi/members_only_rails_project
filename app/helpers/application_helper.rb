module ApplicationHelper
  def check_user
    res = ''
    if user_signed_in?
      res << "Logged in as <strong> #{current_user.name} </strong>"
      res << (link_to 'Log out', destroy_user_session_path, method: :delete)
    else
      res << (link_to 'Sign in', user_session_path)
      res << (link_to 'Sign Up', new_user_registration_path)
    end
    res.html_safe
  end
end
