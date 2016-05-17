var ready;
ready = function() {
  $(".tags").removeClass("active");
  var tag = getUrlParameter("tag");
  var sort = getUrlParameter("sort");
  if (tag != undefined || sort != undefined) {
    $("#tag_" + tag).addClass("active");
    $("#tag_" + sort).addClass("active");
    $("#clear-filter").show();
  } else {
    $("#clear-filter").hide();
  }

  //Get the Ignite ID and YouTube ID from the URL, if present. This method will be used when importing a playlist,
  //with another script calling the /videos/new URL repeatedly, with the parameters pre-filled.
  uid = getUrlParameter("uid");
  igniteID = getUrlParameter("igniteid");
  playlistID = getUrlParameter("playlistID");
  if(uid != null) {
    //If these properties are present, automatically retrieve the information from the YouTube API
    $("#video_url").val("https://www.youtube.com/watch?v=" + uid);
    retrieveYouTubeDetails();
  }

  if ($("#videoStatus").data("videoStatus") == 'draft') {
    retrieveYouTubeDetails();
  }

  if(igniteID != null) {
    $("#video_event_id").val(igniteID);
  }

  if(playlistID != null) {
    $("input:checkbox[value=" + playlistID + "]").attr("checked", true);
  }

  //Retrieve the video's details from the YouTube API
  $("#btnYouTubeRetrieve").on("click", function() {
    retrieveYouTubeDetails();
  });

  $("#video_url").on("keyup", function() {
    $("#btnYouTubeRetrieve").removeClass("disabled");
  });

  $("#video_url").on("focusout", function() {
    $("#btnYouTubeRetrieve").removeClass("disabled");
  });

}


function getBaseUrl() {
  var re = new RegExp(/^.*\//);
  baseURL = re.exec(window.location.href)[0];
  return baseURL.substr(0, baseURL.length - 1)
}

function retrieveYouTubeDetails(){
  //Make a call to the YouTube API to retrieve details about this video
  $("#btnYouTubeRetrieve").addClass("disabled");
  url = $("#video_url").val();
  uid = ytVidId(url);
  // $("#video_uid").val(uid)

  /* Check whether this video has already been added to the system*/
  baseURL = getBaseUrl() + ".json" + "?uid=" + uid
  $.getJSON( baseURL, function( data ) {
    if (data.length > 0) {
      alert("This video has already been added to the site");
      $(".video_url").addClass("field_with_errors");
    } else {
      $(".video_url").removeClass("field_with_errors");
      /* Retrieve details from YouTube*/
      checkURL = "https://www.googleapis.com/youtube/v3/videos?key=AIzaSyD1GKuqhIK7UoPxaLX-PQpCvUlsRYiGD94&fields=items(snippet(title,description,tags))&part=snippet&id=" + uid
      $.getJSON( checkURL, function( data ) {
        if (data.items.length > 0) {
          title = data.items[0].snippet.title;
          description = data.items[0].snippet.description;
          tags = data.items[0].snippet.tags;
          $("#video_title").val(title);
          $("#video_description").val(description);
          $(".details").show();
        } else {
          alert("Unable to retrieve details from YouTube. Please try another URL")
          $(".details").hide();
        }
      });
    }
  });
}

function ytVidId(url) {
  var p = /.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=)([^#\&\?]*).*/ ;
  uid = (url.match(p)) ? RegExp.$1 : false;
  return uid
}   

$(document).ready(ready);
$(document).on('page:load', ready);