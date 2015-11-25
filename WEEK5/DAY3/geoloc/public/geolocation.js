var map;
var retrievedObject = localStorage.getItem('places');
var local = JSON.parse(retrievedObject);

  if(local == null) {
    local = [];
  };
if ("geolocation" in navigator){
  navigator.geolocation.getCurrentPosition(onLocation, onError);
}

function onLocation(position){
  // We can't just directly feed the position into our google map
  // The objects are formatted differently, google maps is looking for
  // an object with "lat" and "lng" keys.
  var myPosition = {
    lat: position.coords.latitude,
    lng: position.coords.longitude
  };
  createMap(myPosition);
  setupAutocomplete();
}

function onError(err){
  console.log("What are you using, IE 7??", err);
}

function createMap(position){
  map = new google.maps.Map($('#map')[0], {
    center: position,
    zoom: 17
  });
  local.forEach(function(place){
    createMarker(place[0]);

  });





}

function createMarker(position) {
  var marker = new google.maps.Marker({
   position: position,
   map: map
 });
}

function setupAutocomplete(){
  var input = $('#get-places')[0];
  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.addListener('place_changed', function(){
    var place = autocomplete.getPlace();
    if (place.geometry.location) {
      map.setCenter(place.geometry.location);
      createMarker(place.geometry.location);
      map.setZoom(17);
    } else {
      alert("The place has no location...?")
    }
    local.push([{lat: place.geometry.location.lat(), lng: place.geometry.location.lng()}, 'infowindow' ]);
    localStorage.setItem('places',JSON.stringify(local));
  });
}
