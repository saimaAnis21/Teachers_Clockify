# rubocop:disable Lint/Syntax
module ApplicationHelper
  def show_anw
    if flash[:alert]
        render(partial: 'shared/alert')
    elsif flash[:notice]
        render(partial: 'shared/notice')
    elsif flash[:warning]
        render(partial: 'shared/warning')
      end
  end

  def icon_dis
    content = ''
    if logged_in? && !request.url.include?('user/show')
      content << link_to fa_icon('align-justify'), user_show_path, class: 'fa-3x color-green m-10'

    end
    content.html_safe
  end

  def nav_dis
    content = ''
    content << "<div class='pr-10'>
                      #{ if logged_in?
                           link_to 'Logout', session_logout_path, method: :delete
                         else
                           link_to 'Log In', session_new_path
                         end }
                      </div>
                      <div class='vl pr-10'></div>
                      <div>
                      #{ if logged_in?
                           link_to current_user.name, user_show_path
                         else
                           link_to 'Register', user_new_path
                         end }
                      </div>"
    content.html_safe
  end

  def topic
    content = ''
    if logged_in?
      if request.url.include?('time_spent/show')
        content << 'Hours Spent Teaching'
      elsif request.url.include?('time_spent/plan_check')
        content << 'Hours Spent Checking/Planning'
      elsif request.url.include?('group/show')
        content << "Groups created by #{current_user.name}"
      elsif request.url.include?('time_spent/new')
        content << 'Enter Teaching Hours'
      elsif request.url.include?('group/new')
        content << 'New Group'
      elsif request.url.include?('group/teach?')
        content << 'Classes conducted'
      end
    end
    content.html_safe
  end
end
# rubocop:enable Lint/Syntax
