var ready;
ready = function() {

  jQuery("#importPlaylistModal").on("shown.bs.modal", function() {
    jQuery("#btnDraftVideos").hide();
    jQuery("#btnCloseImportPlaylist").show();
  });
  jQuery("#importPlaylistModal").on("hidden.bs.modal", function() {
    jQuery("#btnDraftVideos").hide();
    jQuery("#btnCloseImportPlaylist").show();
  });

  jQuery("#addVideosToPlaylistModal").on("shown.bs.modal", function() {
    jQuery("#btnSavePlaylist").hide();
  });
  jQuery("#addVideosToPlaylistModal").on("hidden.bs.modal", function() {
    jQuery("#btnSavePlaylist").hide();
    jQuery(".videoImportToPlaylist").removeClass("checkedRow");
  });

  // Toggle the checkbox state when clicking on the div
  jQuery(".videoImportToPlaylist").click(function() {
    var videoId = this.dataset.videoid;
    var row = jQuery("#rowVideo" + videoId);
    newState = !jQuery("#chkVideo" + videoId)[0].checked;
    jQuery("#chkVideo" + videoId)[0].checked = newState;
    if(newState) {
      row.addClass("checkedRow");
    } else {
      row.removeClass("checkedRow");
    }

    // Enable the Save Playlists button if there are any new videos selected
    if(jQuery(".videoImportToPlaylist.checkedRow").length > 0) {
      jQuery("#btnSavePlaylist").css('display','inline');
    } else {
      jQuery("#btnSavePlaylist").hide();
    }
  });

  // Save the playlist when the Save Playlist button is pressed
  jQuery("#btnSavePlaylist").on("click", function(){
    //TODO: save the playlist with the selected videos appended
    var rows = jQuery(".videoImportToPlaylist.checkedRow");
    var playlistId = jQuery("#spanPlaylistId").text();
    var videoIds = []
    for (var idx = 0; idx < rows.length; idx++) {
      videoIds.push(rows[idx].dataset.videoid);
    }
    console.log("Adding videos with uids: ", videoIds);
    var playlistData = {"playlist": {"id": playlistId, "video_ids": videoIds}};
    $.ajax({
      url: "http://" + window.location.host + "/playlists/" + playlistId,
      type:"PUT",
      dataType:"json",
      data: playlistData,
      success: function(response) {
        jQuery("#addVideosToPlaylistModal").modal('hide');
        location.reload();
      },
      error: function(err) {
        alert("There was a problem saving those videos to the playlist");
      }
    });
  });


  //Import videos from the YouTube API
  jQuery("#btnImportFromYouTubePlaylist").on("click", function() {
    jQuery("#results").empty();
    var YTplaylistId = url = $("#txtYouTubePlaylist").val(); // The YouTube playlist ID
    var id = $("#selPlaylistDropdown").val(); // This is a quoted array containign "[playlistID, eventID]"
    var playlistId = parseInt(id.substr(1, id.indexOf(",") - 1));  // The playlist_id within the IgniteTalks site
    var eventId = parseInt(id.substring(id.indexOf(', ') + 2, id.length - 1));  // The event_id within the IgntieTalks site
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
        html = "<p> Retrieving " + data.items.length + " videos from YouTube...</p>";
        jQuery("#results").append(html);
        for (var idx = 0; idx < data.items.length; idx ++) {          
          // Get the uid of each video. Check whether this video already exists in the system
          var videoId = data.items[idx].contentDetails.videoId;
          var videoURL = window.location.origin + "/videos.json" + "?uid=" + videoId;
          $.ajax ({
              type: "GET",
              url: videoURL,
              videoId: videoId,
              eventId: eventId,
              success: function(data2) {
                if (data2.videos.length > 0) {
                  // This video has already been added to the system
                  // Check whether it's also already present in the current playlist, otherwise add it to the current playlist
                  var playlist_ids = data2.videos[0].playlist_ids;
                  var playlistData = {"playlist": {"id": playlistId, "video_ids": [this.videoId]}}
                  if (playlist_ids.indexOf(playlistId) < 0){
                    $.ajax({
                      url: "http://" + window.location.host + "/playlists/" + playlistId,
                      type:"PUT",
                      dataType:"json",
                      data: playlistData,
                      success: function(response) {
                        if (response == 1) {
                          html = "<p class='subtitle'><i class='fa fa-exclamation-circle'></i> '" + data2.videos[0].title + "' was added to this playlist</p>";
                        } else if (response == 0) {
                          html = "<p class='subtitle'><i class='fa fa-exclamation-circle'></i> '" + data2.videos[0].title + "' was already in this playlist</p>";
                        } else if (response == 999) {
                          html = "<p class='subtitle error'><i class='fa fa-times-circle'></i> 'There was a problem adding " + data2.videos[0].title + "' to this playlist</p>";
                        }
                        jQuery("#results").append(html);
                      },
                      error: function(err) {
                        html = "<p class='subtitle error'><i class='fa fa-times-circle'></i> 'There was a problem adding " + data2.videos[0].title + "' to this playlist</p>";
                        jQuery("#results").append(html);
                      }
                    });
                  } else {
                    html = "<p class='subtitle'><i class='fa fa-exclamation-circle'></i> '" + data2.videos[0].title + "' was already in this playlist</p>";
                    jQuery("#results").append(html);
                  }                  

                } else {

                  // This video doesn't yet exist in the system, so add it to the system and this playlist. Flag it as a draft so
                  // the user can edit it, add the speaker name, etc.

                  // Retrieve the video's details from the YouTube API
                  checkURL = "https://www.googleapis.com/youtube/v3/videos?key=AIzaSyD1GKuqhIK7UoPxaLX-PQpCvUlsRYiGD94&fields=items(snippet(title,description,tags))&part=snippet&id=" + this.videoId;
                  // $.getJSON( checkURL, this.videoId, function( data3 ) {
                  $.ajax({
                    dataType: "json",
                    url: checkURL,
                    videoId: this.videoId,
                    eventId: this.eventId,
                    success: function(data3) {
                      if (data3.items.length > 0) {
                        title = data3.items[0].snippet.title;
                        description = data3.items[0].snippet.description || "TBA";
                        if (description.replace(/ /g, '').length == 0) {
                          description = "TBA"
                        }
                        var video_json = { "video": {"uid": this.videoId, "url": "http://www.youtube.com/watch?v=" + this.videoId, "title": title, "speaker_name": "TBA", "event_id": this.eventId , "description": description, "status": "draft", "playlist_ids": [playlistId]}};
                        var data4 = JSON.stringify(video_json);
                        var post_url = "http://" + window.location.host + "/videos.json";
                        $.ajax({
                          url: post_url,
                          type:"POST",
                          contentType:"application/json; charset=utf-8",
                          dataType:"json",
                          data: data4,
                          title: title,
                          success: function(msg) {
                            html = "<p class='subtitle'><i class='fa fa-check-circle'></i> Added '" + msg.video.title + "'</p>";
                            jQuery("#results").append(html);
                            jQuery("#btnDraftVideos").show();
                            jQuery("#btnCloseImportPlaylist").hide();
                          },
                          error: function(err) {
                            console.log("There was an error creating a new video");
                            html = "<p class='subtitle error'><i class='fa fa-times-circle'></i> 'There was a problem adding '" + this.title + "'' to IgniteTalks. Please try again.</p>";
                            jQuery("#results").append(html);
                          }
                        });
                      }
                    }, 
                    error: function(){
                      console.log("problem")
                    }

                  });
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
