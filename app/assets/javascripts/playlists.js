var ready;

// Use a global object to keep track of the playlist imports.
var videoImport = {};

// if any drafts are added, redirect the user to the Admin page's Videos panel to finish importing them
videoImport.drafts = false;


ready = function() {
  videoImport.counter = 0;

  //Import videos from the YouTube API
  jQuery("#btnImportFromYouTubePlaylist").on("click", function() {

    jQuery("#results").empty();
    html = "<p> Retrieving videos from YouTube...</p>";
    jQuery("#results").append(html);

    var YTplaylistId = url = $("#txtYouTubePlaylist").val(); // The YouTube playlist ID
    var id = $("#selPlaylistDropdown").val(); // This is a quoted array containign "[playlistID, eventID]"
    var playlistId = parseInt(id.substr(1, id.indexOf(",") - 1));  // The playlist_id within the IgniteTalks site
    var eventId = parseInt(id.substr(id.indexOf(', ') + 2, 1));  // The event_id within the IgntieTalks site
    if(url.indexOf("youtube.com") > 0) {
      var YTplaylistId = getPlaylistID(url);
    }    
    ImportFromYouTubePlaylist(YTplaylistId, eventId, playlistId);
  });

  function ImportFromYouTubePlaylist(YTplaylistId, eventId, playlistId) {
    
    // Check the YouTube API for this playlist
    var playlistUrl = "https://www.googleapis.com/youtube/v3/playlistItems?key=AIzaSyD1GKuqhIK7UoPxaLX-PQpCvUlsRYiGD94&part=contentDetails"
    playlistUrl += "&maxResults=50&fields=items(contentDetails(videoId))&playlistId=" + YTplaylistId

    // Retrieve the list of playlistItems from the YouTube Playlist
    $.getJSON( playlistUrl, function( data ) {
      if (data !== null && data.items !== null) {
        videoImport.numVideos = data.items.length;
        for (var idx = 0; idx < videoImport.numVideos; idx ++) {          
          // Get the uid of each video. Check whether this video already exists in the system
          var videoId = data.items[idx].contentDetails.videoId;
          var videoURL = window.location.origin + "/videos.json" + "?uid=" + videoId;
          var jqxhr = $.ajax ({
              type: "GET",
              url: videoURL,
              success: function(data2) {
                videoImport.counter += 1;
                console.log(videoImport.counter);
                if (data2.videos.length > 0) {

                  // This video has already been added to the system
                  // TODO Check whether it's also already present in the current playlist, otherwise add it to the current playlist
                  html = "<p class='subtitle'><i class='fa fa-exclamation-circle'></i> '" + data2.videos[0].title + "' already exists</p>";
                  jQuery("#results").append(html);

                } else {

                  // This video doesn't yet exist in the system, so add it to the system and this playlist. Flag it as a draft so
                  // the user can edit it, add the speaker name, etc.

                  // Retrieve the video's details from the YouTube API
                  checkURL = "https://www.googleapis.com/youtube/v3/videos?key=AIzaSyD1GKuqhIK7UoPxaLX-PQpCvUlsRYiGD94&fields=items(snippet(title,description,tags))&part=snippet&id=" + videoId;
                  $.getJSON( checkURL, function( data3 ) {
                  if (data3.items.length > 0) {
                    title = data3.items[0].snippet.title;
                    description = data3.items[0].snippet.description || "TBA";
                    tags = data3.items[0].snippet.tags;

                    //TODO: add the correct event ID and Tags, and add it to the correct playlist
                    var video_json = { "video": {"uid": videoId, "url": "http://www.youtube.com/watch?v=" + videoId, "title": title, "speaker_name": "TBA", "event_id": eventId , "description": description, "status": "draft", "playlist_ids": [playlistId]}};
                    var data4 = JSON.stringify(video_json);
                    var post_url = "http://" + window.location.host + "/videos.json";
                    $.ajax({
                      url: post_url,
                      type:"POST",
                      contentType:"application/json; charset=utf-8",
                      dataType:"json",
                      data: data4,
                      success: function(msg) {
                        html = "<p class='subtitle'><i class='fa fa-check-circle'></i> Added '" + msg.video.title + "'</p>";
                        jQuery("#results").append(html);
                        videoImport.drafts = true;
                      },
                      error: function(err) {
                        console.log("There was an error creating a new video")
                      }
                    });
                  }
                });
              }
              if (videoImport.counter == videoImport.numVideos) {
                if (videoImport.drafts) {
                  html = "<p><strong>You will shortly be redirected to the Videos panel on the <a href='admin?tabpane=videos'>Admin</a> page to finish importing these videos</strong></p>";
                } else {
                  html = "<p><strong>Finished importing videos to this playlist. No further action is required.</strong></p>"
                }
                jQuery("#results").append(html);
              }
            },
              error: function() {
                alert("Sorry, there was a problem importing videos from this playlist");
              }
            });
          }
        } else {
        alert("Sorry, there was a problem importing videos from this playlist");
      }
    });
  }

  function getPlaylistID(url) {

    var regExp = /^.*(youtu.be\/|list=)([^#\&\?]*).*/;
    var match = url.match(regExp);
    if (match && match[2]){
      return match[2];
    }
    return null;
  }

  $('#importPlaylistModal').on('hidden.bs.modal', function (e) {
    jQuery("#results").empty();
    jQuery("#txtYouTubePlaylist").val('');
  })
  
}

$(document).ready(ready);
$(document).on('page:load', ready);
