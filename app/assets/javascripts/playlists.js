var ready;
ready = function() {

  //Import videos from the YouTube API
  jQuery("#btnImportFromYouTubePlaylist").on("click", function() {
    jQuery("#draftVideos").empty();

    var playlistId = url = $("#txtYouTubePlaylist").val();
    var eventId = $("#playlist_event_id").val();
    if(url.indexOf("youtube.com") > 0) {
      var playlistId = getPlaylistID(url);
    }    
    ImportFromYouTubePlaylist(playlistId, eventId);
  });

  jQuery('#YouTubeVideos').on("click", ".playlistItem", function() {
    uid = this.attributes[1].value;
  });

  function ImportFromYouTubePlaylist(playlistId, eventId) {
    
    // Check the YouTube API for this playlist
    var playlistUrl = "https://www.googleapis.com/youtube/v3/playlistItems?key=AIzaSyD1GKuqhIK7UoPxaLX-PQpCvUlsRYiGD94&part=contentDetails"
    playlistUrl += "&maxResults=50&fields=items(contentDetails(videoId))&playlistId=" + playlistId

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
                        $.getJSON( checkURL, function( data ) {
                          if (data.items.length > 0) {
                            title = data.items[0].snippet.title;
                            description = data.items[0].snippet.description;
                            tags = data.items[0].snippet.tags;

                            //TODO: add the correct event ID and Tags, and add it to the correct playlist
                            var pID = 13
                            var video_json = { "video": {"uid": videoId, "url": "http://www.youtube.com/watch?v=" + videoId, "title": title, "speaker_name": "TBA", "event_id": eventId , "description": description, "status": "draft", "playlistIds": [pID], "tags": tags}};
                            var data3 = JSON.stringify(video_json);
                            var url = "http://" + window.location.host + "/videos.json";
                            $.ajax({
                              url: url,
                              type:"POST",
                              contentType:"application/json; charset=utf-8",
                              dataType:"json",
                              data: data3,
                              success: function(msg) {
                                // Add the video's thumbnail to the page. Clicking on the thumbnail will open the
                                // New Video dialog with this video selected
                                html = "<div class='playlistItem col-md-2' data-uid'=" + msg.video.uid + "'>"
                                html += "<img src=http://img.youtube.com/vi/" + msg.video.uid + "/hqdefault.jpg>"
                                html += "<p class='subtitle'>" + msg.video.title + "</p>";
                                html += "</div>"
                                jQuery("#draftVideos").append(html);
                              },
                              error: function(err) {
                                alert("There was an error creating a new video")
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

  $('#newVideoModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); 
    var uid = button.data('uid');
    var playlistID = this.attributes["data-playlistID"].value;
    url = "http://localhost:3000/videos/new?popup=true&uid=" + uid + "&playlistID=" + playlistID
    var modal = $(this);
    modal.find('.modal-title').text(url);
    modal.find('.modal-body').html("<iframe src='" + url + "' width='100%' height='800px'>")
  })
  
}

$(document).ready(ready);
$(document).on('page:load', ready);