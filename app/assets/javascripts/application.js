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
        console.log(eventID);
        layer.openPopup()
      }
    });
  });

  $( "body" ).delegate( ".event_content", "mouseleave", function() {
    $(this).removeClass("active");
  });

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

  // Toggle switches for draft/published
  $(".draft").toggle($("#chkDrafts").is("checked"))
  $(".published").toggle($("#chkPublished").is("checked"))
  
  $(".bootstrapSwitch").bootstrapSwitch();

  $("#chkDrafts").on('switchChange.bootstrapSwitch', function(event, state) {
    $(".draft").toggle(state);
  });

  $("#chkPublished").on('switchChange.bootstrapSwitch', function(event, state) {
    $(".published").toggle(state);
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
}

$(document).ready(pageLoad);
$(document).on('page:load', pageLoad);