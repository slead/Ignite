function pageLoad() {
  console.log("data tables")
  $('#videos').DataTable();
}

$(document).ready(pageLoad);
$(document).on('page:load', pageLoad);