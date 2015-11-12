var ready;
ready = function() {

  //Import videos from the YouTube API
  jQuery("#btnImportFromYouTubePlaylist").on("click", function() {
    jQuery("#YouTubeVideos").empty();

    var playlistId = url = $("#txtYouTubePlaylist").val();
    if(url.indexOf("youtube.com") > 0) {
      var playlistId = getPlaylistID(url);
    }    
    ImportFromYouTubePlaylist(playlistId);
  });

  jQuery('#YouTubeVideos').on("click", ".playlistItem", function() {
    uid = this.attributes[1].value;
    console.log(uid);

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
                  if (data2.length > 0) {

                    // This video has already been added to the system
                    // TODO Check whether it's also already present in the current playlist, otherwise add it.
                  } else {

                    // Add the video's thumbnail to the page. Clicking on the thumbnail will open the
                    // New Video dialog with this video selected
                    html = "<div class='playlistItem col-md-2' data-uid='" + videoId + "' data-target='#newVideoModal' data-toggle='modal'>"
                    html += "<img src=http://img.youtube.com/vi/" + videoId + "/hqdefault.jpg>"
                    html += "</div>"
                    jQuery("#YouTubeVideos").append(html);
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

  $('#newVideoModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); 
    var uid = button.data('uid');
    var modal = $(this);
    var playlistID = this.attributes["data-playlistID"].value;
    url = "http://localhost:3000/videos/new?uid=" + uid + "&playlistID=" + playlistID
    modal.find('.modal-title').text(url);
    modal.find('.modal-body').html("<iframe src='" + url + "' width='100%' height='800px'>")
  })
}

$(document).ready(ready);
$(document).on('page:load', ready);
