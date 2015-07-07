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

  $("#btnYouTubeRetrieve").on("click", function() {
    url = $("#video_url").val();
    checkURL = ytVidId(url);
    $.getJSON( checkURL, function( data ) {
      if (data.items.length > 0) {
        title = data.items[0].snippet.title;
        description = data.items[0].snippet.description;
        $("#video_title").val(title);
        $("#video_description").val(description);
      }
    });
  });

}

function getUrlParameter(sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) 
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) 
        {
            return sParameterName[1];
        }
    }
}

function ytVidId(url) {
  var p = /^(?:https?:\/\/)?(?:www\.)?youtube\.com\/watch\?(?=.*v=((\w|-){11}))(?:\S+)?$/;
  uid = (url.match(p)) ? RegExp.$1 : false;
  return "https://www.googleapis.com/youtube/v3/videos?key=AIzaSyCj-uI-OrlNIR9LGyjM2IRFPgEv8kEKaMw&fields=items(snippet(title,description))&part=snippet&id=" + uid
}   

$(document).ready(ready);
$(document).on('page:load', ready);