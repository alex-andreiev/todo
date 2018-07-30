module ApplicationHelper
  def confirm_button_class(status)
    status ? 'success' : 'secondary'
  end
end
