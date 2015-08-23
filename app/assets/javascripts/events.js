var ready;
ready = function() {

  var stamen = new L.StamenTileLayer("toner-lite");
  var geojsonMarkerOptions = {
    radius: 8,
    fillColor: "#ed9c28",
    color: "#000",
    weight: 1,
    opacity: 1,
    fillOpacity: 0.8
  };

  // Initialise the map for the Index page
  if ( $("#map").length ) {

    leafletMap = new L.Map("map", {
      center: [40, -73],
      zoom: 3,
      maxZoom: 9,
      minZoom: 2,
      layers: [stamen],
      maxBounds: L.latLngBounds(L.latLng(-90, -180), L.latLng(90, 180))
    });

    // Fetch the events within  the current map extent, and re-fetch them when it changes
    mapSearch();
    leafletMap.on('moveend', mapSearch);

  } 

  function mapSearch() {
    // Request events within the current map extent

    extent = leafletMap.getBounds();
    var northEast = extent._northEast.wrap();
    var southWest = extent._southWest.wrap();
    currentZoom = leafletMap.getZoom();

    url = "events.json?bbox=" + southWest.lat + "," + southWest.lng + "," + northEast.lat + "," + northEast.lng + "&zoom=" + currentZoom;
    $.ajax({
      dataType: 'text',
      url: url,
      success: function(data) {
        var geojson;
        geojson = $.parseJSON(data);

        // Add the events to the map
        jsonLayer = L.geoJson(geojson, {
          pointToLayer: function (feature, latlng) {
            return L.circleMarker(latlng, geojsonMarkerOptions);
          },
          onEachFeature: function (feature, layer) {
            if(feature.properties.name != undefined) {
              if(feature.properties.url != undefined) {
                layer.bindPopup("<a href='" + feature.properties.url + "''>" + feature.properties.name + "</a>");
              } else {
                layer.bindPopup(feature.properties.name);
              }
            }
          }
        });
        featureGroup = L.featureGroup()
        featureGroup.addLayer(jsonLayer)
        featureGroup.addTo(leafletMap);

        // Create a new text entry for each event
        var html = '';
        if (geojson.length > 0) {
          for (var idx = 0; idx <geojson.length; idx++) {
            if (idx % 4 == 0) {
              html += "<div class='row'>";
            }
            event = geojson[idx].properties;
            html += "<div class='col-md-3 col-sm-3 col-xs-3 event_content' id='" + event.id + "''>";
            html += "<div><h4 class='title'><a href=" + event.url + ">" + event.name + "<span class='link-spanner'></span></a></h4></div>";
            html += "<div><p class='subtitle'>" + event.city + ", " + event.country + "</p></div>";
            html += "</div>"; // event_content
            if (idx % 4 == 3) {
              html += "</div>"
            }
          }
        }
        $("#results").html(html);
  
      },
      error: function() {
        console.log("Error with Index map");
      }
    });
  }
};

$(document).ready(ready);
$(document).on('page:load', ready);