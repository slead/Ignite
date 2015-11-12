var ready;
ready = function() {

  //Import videos from the YouTube API
  $("#btnImportFromYouTubePlaylist").on("click", function() {
    jQuery("#YouTubeVideos").empty();

    var playlistId = url = $("#txtYouTubePlaylist").val();
    if(url.indexOf("youtube.com") > 0) {
      var playlistId = getPlaylistID(url);
    }    
    ImportFromYouTubePlaylist(playlistId);
  });

  function ImportFromYouTubePlaylist(playlistId) {
    
    url = "https://www.googleapis.com/youtube/v3/playlistItems?key=AIzaSyD1GKuqhIK7UoPxaLX-PQpCvUlsRYiGD94&part=contentDetails"
    url += "&maxResults=50&fields=items(contentDetails(videoId))&playlistId=" + playlistId

    // Retrieve the list of playlistItems from the YouTube Playlist
    $.getJSON( url, function( data ) {
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
                  exists = false;
                  if (data2.length > 0) {
                    exists = true;
                  }

                  // Add the video's thumbnail to the page. Clicking on the thumbnail will open the
                  // New Video dialog with this video selected
                  html = "<div class='playlistItem col-md-2'>"
                  html += "<span>" + exists + "</span>";
                  html += "<img src=http://img.youtube.com/vi/" + videoId + "/hqdefault.jpg>"
                  html += "</div>"
                  jQuery("#YouTubeVideos").append(html);

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
        alert("Sorry - unable to retrieve videos from this YouTube playlist");
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
}

$(document).ready(ready);
$(document).on('page:load', ready);
