function pageLoad() {
  $('#tblVideos').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": $('#tblVideos').data('source'),
    "pagingType": "full_numbers",
    columns: [
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: false, searchable: false },
        { sortable: false, searchable: false },
        { sortable: false, searchable: false }
      ]
  });

  $('#tblEvents').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": $('#tblEvents').data('source'),
    "pagingType": "full_numbers",
    columns: [
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: false, searchable: false },
        { sortable: false, searchable: false }
      ]
  });

  // Enable datatables on the admin page
  // $('#videos').dataTable({
  //   "columnDefs": [
  //     { "orderable": false, "targets": [3,7,8,9] }
  //   ]
  // });

    $('#playlists').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": [2] }
    ]
  });

  // $('#events').DataTable({
  //   "columnDefs": [
  //     { "orderable": false, "targets": [4,5] }
  //   ]
  // });

  $('#upcoming').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": [3] }
    ]
  });

  $('#users').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": [3, 4] }
    ]
  });

}

$(document).ready(pageLoad);
$(document).on('page:load', pageLoad);