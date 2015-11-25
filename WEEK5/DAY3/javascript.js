var coord1;
var coord2;
var urlRoot = "https://maps.googleapis.com/maps/api/staticmap?center=";
var urlParams = "&zoom=13&size=400x300";
var url;


if ("geolocation" in navigator) {
  console.log("gelocation is avaliable");
}else{
  console.log("gelocation IS NOT avaliable");
}


function onLocation(position) {
  console.log('Your latitude is ' + position.coords.latitude);
  console.log('Your longitude is ' + position.coords.longitude);
  document.getElementById('position').innerHTML = 'Lat: ' + position.coords.latitude + ', lon: ' + position.coords.longitude;
  coord1 = position.coords.latitude;
  coord2 = position.coords.longitude;
  url = urlRoot + coord1 + "," + coord2 + urlParams;
  $(document).append('<img src="'+url+'">','map');
}

function onError(error){
  console.error(error);
}

var options = {
  enableHighAccuracy: true
};

navigator.geolocation.getCurrentPosition(onLocation, onError, options);
var watchId = navigator.geolocation.watchPosition(onLocation, onError,options);
