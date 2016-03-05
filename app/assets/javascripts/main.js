
$(document).ready(function(){
    var map = L.map('map');

    // create the tile layer with correct attrib    ution
    L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '<p>Tiles Courtesy of <a href="http://www.mapquest.com/" target="_blank">MapQuest</a> <img src="http://developer.mapquest.com/content/osm/mq_logo.png"></p>'
        }
    ).addTo(map);

    var markers = L.markerClusterGroup({ disableClusteringAtZoom: 9, maxClusterRadius: 40 });

    $.ajax({
        url: "#{foodbanks_path}.json",
        dataType: 'json',
        success: function(data) {

            locationCount = data.length;

            for (var i = 0; i < locationCount; i++) {
                var title = data[i].name
                var marker = L.marker(new L.LatLng(data[i].coordinates[0], data[i].coordinates[1]), { title: title });
                marker.bindPopup(title);
                markers.addLayer(marker);
            }
            map.addLayer(markers);
            map.fitBounds(markers.getBounds());
        }
    });

});