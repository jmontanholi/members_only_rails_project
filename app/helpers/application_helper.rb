module ApplicationHelper
  def check_user
    res = ''
    if user_signed_in?
      res << "Logged in as <strong> #{current_user.name.capitalize} </strong>"
      res << (link_to 'Log out', destroy_user_session_path, method: :delete, class:"link bg-danger rounded text-light p-2 ms-2")
    else
      res << (link_to 'Sign in', user_session_path, class:"text-light mx-4 link p-2")
      res << (link_to 'Sign Up', new_user_registration_path, class:"text-light mx-4 link p-2")
    end
    res.html_safe
  end
end
