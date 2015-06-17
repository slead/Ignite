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