var ready;
ready = function() {
  $(".tags").removeClass("active");
  var tag = getUrlParameter("tag");
  if (tag != undefined) {
    $("#tag_" + tag).addClass("active");
    $("#clear-filter").show();
  } else {
    $("#clear-filter").hide();
  }
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

$(document).ready(ready);
$(document).on('page:load', ready);