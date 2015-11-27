function fetchTracks(){
  var newSearch = 'q=' + $('.form-control').val();
  request = $.get('https://api.spotify.com/v1/search?type=track',newSearch);
  console.log(request);

function handleTracks(request){
  console.log(request);
    request.tracks.items.forEach(function(track){
        var html = '<div class="track" ><a href="#"><img data-url="' + track.preview_url + '" class="thumbnail" src="' + track.album.images[0].url + '"><p>' + track.name + '</p></a></div>';
        $('.results').append(html);
    });
  }//End of handleTracks
function handleError (err1, err2, err3) {
    console.error('OH NO!!', err1, err2, err3);
  }//end of handleError

request.done(handleTracks);
request.fail(handleError);

}//End of fetchTracks

function generatePlayer(uri){
  var result = '<audio src="'+ uri +'" class="js-player"></audio>';
  return result;
};

function generateBar(){
  var result = '<div class="progress"><div id="pbar" class="progress-bar progress-bar-custom" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"><span class="sr-only">0% Complete</span></div></div>';
$('.player').append(result);
};


function printTime () {
  $('#pbar').toggle();
  var current = $('.js-player').prop('currentTime');
  console.debug('Current time: ' + current);
  $('#pbar').attr('aria-valuenow', current*3.33);
  var cssWidth = current*3.33+'%';
  $('.progress-bar-custom').css({width:cssWidth});
  $('.sr-only').html(current*3.33 + '% Complete');
  console.log('time passes');
  $('#pbar').toggle();
};

// Have printTime be called when the time is updated


function generatePlayerControls(){
  $('.player').html('<button id="playbtn" class="btn btn-success play-btn"><span class="glyphicon glyphicon-play" aria-hidden="true"></span>  ');
};

$(document).on('click', '.btn', function(){
    $('.results').empty();
    fetchTracks();
});

$(document).on('click', '.thumbnail', function(){
  event.preventDefault;
  $('.player').empty();
  console.log($(event.target).data('url'));
  var player = generatePlayer($(event.target).data('url'));
  var controls = generatePlayerControls();
  var bar = generateBar();
  $('.player').append(player);

});

$(document).on('click', '.play-btn', function(){
  event.preventDefault;
  console.log("here");
  if ($('.glyphicon').hasClass('glyphicon-play')){
    $('.glyphicon').removeClass('glyphicon-play');
    $('.glyphicon').addClass('glyphicon-pause');
    $('.js-player').trigger('play');
    $('.js-player').on('timeupdate', printTime);
    $('.js-player').prop('currentTime');
  } else {
    $('.glyphicon').addClass('glyphicon-play');
    $('.glyphicon').removeClass('glyphicon-pause');
    $('.js-player').trigger('pause');
  };
});
