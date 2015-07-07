function pageLoad() {  
  // Enable datatables on the admin page
  $('#videos').dataTable({
    "columnDefs": [
      { "orderable": false, "targets": [2,6,7,8] }
    ]
  });

  $('#draft_videos').dataTable({
    "columnDefs": [
      { "orderable": false, "targets": [2,6,7,8] }
    ]
  });

  $('#events').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": [4,5] }
    ]
  });

  $('#draft_events').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": [4,5] }
    ]
  });

  $('#upcoming').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": [3] }
    ]
  });

  $('#draft_upcoming').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": [3] }
    ]
  });

  // Toggle switches for draft/published, using BootStrapSwitch plugin
  $(".bootstrapSwitch").bootstrapSwitch();
  if(Cookies.get("chkDrafts") == 'true') {
    $("#chkDrafts").bootstrapSwitch('state', true)
    $(".draft").toggle(true);
  } else {
    $("#chkDrafts").bootstrapSwitch('state', false)
    $(".draft").toggle(false);
  }

  if(Cookies.get("chkPublished") == 'true') {
    $("#chkPublished").bootstrapSwitch('state', true)
    $(".published").toggle(true);
  } else {
    $("#chkPublished").bootstrapSwitch('state', false)
    $(".published").toggle(false);
  }

  $("#chkDrafts").on('switchChange.bootstrapSwitch', function(event, state) {
    $(".draft").toggle(state);
    Cookies.set('chkDrafts', state);
  });

  $("#chkPublished").on('switchChange.bootstrapSwitch', function(event, state) {
    $(".published").toggle(state);
    Cookies.set('chkPublished', state);
  });
}

$(document).ready(pageLoad);
$(document).on('page:load', pageLoad);