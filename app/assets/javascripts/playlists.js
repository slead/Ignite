var ready;
ready = function() {

  //Import videos from the YouTube API
  $("#btnImportFromYouTubePlaylist").on("click", function() {
    var playlistId = url = $("#txtYouTubePlaylist").val();
    if(url.indexOf("youtube.com") > 0) {
      var playlistId = getPlaylistID(url);
    }    
    ImportFromYouTubePlaylist(playlistId);
  });

  function ImportFromYouTubePlaylist(playlistId) {
    
    url = "https://www.googleapis.com/youtube/v3/playlistItems?key=AIzaSyD1GKuqhIK7UoPxaLX-PQpCvUlsRYiGD94&part=contentDetails&maxResults=50&fields=items(contentDetails(videoId))&playlistId=" + playlistId
    $.getJSON( url, function( data ) {
      if (data !== null && data.items !== null) {
        for (var idx = 0; idx < data.items.length; idx ++) {
          try{
            var videoId = data.items[idx].contentDetails.videoId;
            var img = "http://img.youtube.com/vi/" + videoId + "/hqdefault.jpg"
            console.log(img);
          } catch(err){
            alert(err);
          }
        }

      } else {
        alert("Error - unable to retrieve videos from this YouTube playlist");
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
