$("[data-task='<%= params[:id] %>']").find('[data-content]').hide()
$("[data-task='<%= params[:id] %>']").append('<%= j render partial: 'tasks/edit_form' %>')
$('[data-link]').show()
