function pageLoad() {
  
  $('#videos').dataTable({
    "columnDefs": [
      { "orderable": false, "targets": [6,7,8] }
    ]
  });

  $('#events').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": [4,5] }
    ]
  });
}

$(document).ready(pageLoad);
$(document).on('page:load', pageLoad);
