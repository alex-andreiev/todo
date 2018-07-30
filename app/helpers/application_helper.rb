module ApplicationHelper
  def confirm_button_class(status)
    status ? 'success' : 'secondary'
  end

  def priority_class(level)
    case level
    when 'whenever' then 'text-secondary'
    when 'low' then 'text-primary'
    when 'medium' then 'text-success'
    when 'high' then 'text-warning'
    when 'immediate' then 'text-danger'
    end
  end
end
