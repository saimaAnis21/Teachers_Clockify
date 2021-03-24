module TimeSpentHelper
  def show_timespent
    content = ''

    unless @ts.nil?
      content << "<div class='d-inline'>#{@ts.created_at.strftime('%d %b %Y')}</div>
      <div class='d-inline pl-5'>#{@ts.name}</div>
      <div class='float-r'>Total:#{time_in_hrs(@ts.Amount)} </div>"
    end
    content.html_safe
  end

  def render_grpview
    content = ''
    content << "<div> #{render 'shared/groupview'} </div>" unless @ts.nil?
    content.html_safe
  end
end
