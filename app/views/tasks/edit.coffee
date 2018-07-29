$("[data-task='<%= params[:id] %>']").html('<%= j render partial: 'tasks/edit_form' %>')
