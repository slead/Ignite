// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/extras/dataTables.responsive
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require turbolinks
//= require_tree .
//= require leaflet

function pageLoad() {
  setTimeout(function() {
    $('#notice_wrapper').fadeOut("slow", function() {
      $(this).remove();
    })
    $('#alert_wrapper').fadeOut("slow", function() {
      $(this).remove();
    })
  }, 4500)

  // When hovering over the event's text content, open its map infoWindow
  $( "body" ).delegate( ".event_content", "mouseenter", function() {
    $(this).addClass("active");
    eventID = this.id
    jsonLayer.eachLayer(function (layer) {
      if(eventID == layer.feature.properties.id) {
        layer.openPopup()
      }
    });
  });

  $( "body" ).delegate( ".event_content", "mouseleave", function() {
    $(this).removeClass("active");
  });

  // Hide/show the navbar on the homepage (only)
  if(window.location.pathname == "/") {
    $(".navbar").hide();
    
    // fade in .navbar
    $(function () {
      $(window).scroll(function () {
        if ($(this).scrollTop() > 150) {
          $('.navbar').fadeIn();
        } else {
          $('.navbar').fadeOut();
        }
      });
    });

  } else {
    $(".navbar").show();
    $(window).unbind('scroll');
  }

  // Use cookies to remember the Admin tab which was last open
  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    Cookies.set("tabpane", e.target.id);
  })

  // The current tab may be specified in the URL as ?tabpane=
  // If not, try to set the current tab from a cookie
  try {
    var tabpane = getUrlParameter("tabpane");
    if (tabpane != undefined) {
      $('#tab_' + tabpane).tab('show');
    } else if (Cookies.get("tabpane") != undefined) {
      $('#' + Cookies.get("tabpane")).tab('show');
    }
  } catch (e){
    console.log("there was a problem opening the appropriate the admin tab")
  }

  $('#tblVideos').dataTable({
    "responsive": true,
    "processing": true,
    "serverSide": true,
    "ajax": $('#tblVideos').data('source'),
    columns: [
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: false, searchable: true },
        { sortable: true, searchable: true },
        { sortable: false, searchable: false },
        { sortable: false, searchable: false },
        { sortable: false, searchable: false }
      ],
      "language": {
        "emptyTable": "No videos found"
      }
  });

  $('#tblDraftVideos').dataTable({
    "responsive": true,
    "processing": true,
    "serverSide": true,
    "ajax": $('#tblDraftVideos').data('source'),
    columns: [
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: false, searchable: true },
        { sortable: true, searchable: true },
        { sortable: false, searchable: false },
        { sortable: false, searchable: false },
        { sortable: false, searchable: false }
      ],
      "language": {
        "emptyTable": "No draft videos found"
      }
  });

  $('#tblEvents').dataTable({
    "responsive": true,
    "processing": true,
    "serverSide": true,
    "ajax": $('#tblEvents').data('source'),
    columns: [
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: false, searchable: false },
        { sortable: false, searchable: false }
      ],
      "language": {
        "emptyTable": "No events found"
      }
  });

  $('#tblPlaylists').dataTable({
    "responsive": true,
    "processing": true,
    "serverSide": true,
    "ajax": $('#tblPlaylists').data('source'),
    columns: [
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: true, searchable: false },
        { sortable: false, searchable: false },
        { sortable: false, searchable: false }
      ],
      "language": {
        "emptyTable": "No playlists found"
      }
  });

  $('#tblUpcomings').dataTable({
    "responsive": true,
    "processing": true,
    "serverSide": true,
    "ajax": $('#tblUpcomings').data('source'),
    columns: [
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: false, searchable: false },
        { sortable: false, searchable: false }
      ],
      "language": {
        "emptyTable": "No upcoming events found"
      }
  });

  $('#tblUsers').dataTable({
    "responsive": true,
    "processing": true,
    "serverSide": true,
    "ajax": $('#tblUsers').data('source'),
    columns: [
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: false, searchable: false },
        { sortable: false, searchable: false }
      ],
      "language": {
        "emptyTable": "No users found"
      }
  });

  $('#tblTags').dataTable({
    "responsive": true,
    "processing": true,
    "serverSide": true,
    "ajax": $('#tblTags').data('source'),
    columns: [
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: false, searchable: false },
        { sortable: false, searchable: false }
      ],
      "language": {
        "emptyTable": "No tags found"
      }
  });

  $('#tblUsersVideos').dataTable({
    "responsive": true,
    "processing": true,
    "serverSide": true,
    "ajax": $('#tblUsersVideos').data('source'),
    columns: [
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
        { sortable: true, searchable: true },
      ],
      "language": {
        "emptyTable": "No videos found"
      }
  });

  
}

$(document).on('turbolinks:load', pageLoad);
// $(document).ready(pageLoad);
// $(document).on('page:load', pageLoad);

function getUrlParameter(sParam){
  var sPageURL = window.location.search.substring(1);
  var sURLVariables = sPageURL.split('&');
  for (var i = 0; i < sURLVariables.length; i++) 
  {
      var sParameterName = sURLVariables[i].split('=');
      if (sParameterName[0] == sParam) 
      {
          return sParameterName[1];
      }
  }
}