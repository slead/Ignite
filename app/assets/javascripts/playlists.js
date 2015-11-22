var ready;
ready = function() {

  //Import videos from the YouTube API
  jQuery("#btnImportFromYouTubePlaylist").on("click", function() {

    var YTplaylistId = url = $("#txtYouTubePlaylist").val(); // The YouTube playlist ID
    var playlistId = parseInt($("#spanPlaylistId").text());  // The playlist_id within the IgniteTalks site
    var eventId = parseInt($("#playlist_event_id").val());
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
    try{
      $.getJSON( playlistUrl, function( data ) {
        if (data !== null && data.items !== null) {
          for (var idx = 0; idx < data.items.length; idx ++) {          
            try{

              // Get the uid of each video. Check whether this video already exists in the system
              var videoId = data.items[idx].contentDetails.videoId;
              var videoURL = window.location.origin + "/videos.json" + "?uid=" + videoId;
              checkIfVideoExists(videoURL, videoId);

              function checkIfVideoExists(videoURL, videoId) {
                $.ajax ({
                  type: "GET",
                  url: videoURL,
                  success: function(data2) {
                    if (data2.videos.length > 0) {

                      // This video has already been added to the system
                      // TODO Check whether it's also already present in the current playlist, otherwise add it to the current playlist
                      console.log(data2.videos[0].title + " already exists")

                    } else {

                      // This video doesn't yet exist in the system, so add it to the system and this playlist. Flag it as a draft so
                      // the user can edit it, add the speaker name, etc.

                      // Retrieve the video's details from the YouTube API
                      checkURL = "https://www.googleapis.com/youtube/v3/videos?key=AIzaSyD1GKuqhIK7UoPxaLX-PQpCvUlsRYiGD94&fields=items(snippet(title,description,tags))&part=snippet&id=" + videoId;
                      try{
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
                                console.log("Successfully added draft video " + msg.video.title);

                                // html = "<div class='playlistItem col-md-2' data-uid'=" + msg.video.uid + "'>"
                                // html += "<img src=http://img.youtube.com/vi/" + msg.video.uid + "/hqdefault.jpg>"
                                // html += "<p class='subtitle'>" + msg.video.title + "</p>";
                                // html += "</div>"
                                // jQuery("#draftVideos").append(html);
                              },
                              error: function(err) {
                                console.log("There was an error creating a new video")
                              }
                          });
                        }
                      });
                      } catch(err){
                        alert("Sorry, there was a problem importing videos from this playlist");
                      }
                  }
                },
                  error: function() {
                    alert("Sorry, there was a problem importing videos from this playlist");
                  }
                });
              }

            } catch(err){
              alert("Sorry, there was a problem importing videos from this playlist");
            }
          }

        } else {
          alert("Sorry, there was a problem importing videos from this playlist");
        }
      });
    } catch(err) {
      alert("Sorry, there was a problem importing videos from this playlist");
    }
  }

  function getPlaylistID(url) {

    var regExp = /^.*(youtu.be\/|list=)([^#\&\?]*).*/;
    var match = url.match(regExp);
    if (match && match[2]){
      return match[2];
    }
    return null;
  }
  
}

$(document).ready(ready);
$(document).on('page:load', ready);
