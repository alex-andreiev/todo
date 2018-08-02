$("[data-todo='<%= params[:id] %>']").find('[data-content]').hide()
$("[data-todo='<%= params[:id] %>']").append('<%= j render partial: 'todos/form' %>')
$('[data-link="new"]').hide()
