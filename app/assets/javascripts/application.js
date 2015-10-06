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
//= require social-share-button
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
    console.log("setting cookie " + e.target.id)
  })

  if (Cookies.get("tabpane") != undefined) {
    $('#' + Cookies.get("tabpane")).tab('show');
    console.log("getting cookie " + Cookies.get("tabpane"))
  }

  // Enable datatables on the admin page
  $('#videos').dataTable({
    "columnDefs": [
      { "orderable": false, "targets": [3,7,8,9] }
    ]
  });

  $('#events').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": [4,5] }
    ]
  });

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