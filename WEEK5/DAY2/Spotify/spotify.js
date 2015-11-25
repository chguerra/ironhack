var request = [];

function fetchArtists () {
  var newSearch = 'q=' + $('.search').val();
  request = $.get('https://api.spotify.com/v1/search?type=artist',newSearch);

  function checkImage (artist){
    if (artist.images.length == 0){
      return 'http://www.brandsoftheworld.com/sites/default/files/styles/logo-thumbnail/public/092014/spotify_2014_0.png?itok=KdC40xfv';
    } else {
        return artist.images[0].url;
    }
  };

  function  generateModal (artist){
    return '<button id="myModal" type="button" class="btn btn-success btn-lg artistbutton" data-artist="' + artist.id + '" style="display:block;margin: 0 auto;" data-toggle="modal" data-target=".bs-example-modal-sm">Albums</button>';
  };

  function handleArtists (request) {
    console.log(request);
    request.artists.items.forEach(function (artist){
      var html = '<div class="artist"><img class="thumbnail" src="' + checkImage(artist) + '"><p>' + artist.name + '</p>' + generateModal(artist) + '</div>';
      $('.results').append(html);
    });

  }

  function handleError (err1, err2, err3) {
    console.error('OH NO!!', err1, err2, err3);
  }

  request.done(handleArtists);
  request.fail(handleError);
}

function fetchAlbums(id){
  var albums = $.get('https://api.spotify.com/v1/artists/' + id + '/albums');


  function handleAlbums(albums){
  console.log(albums);
    $('.modal-content').empty();
  albums.items.forEach(function (album){
      var html = '<li><a class="album" href="#" data-album="' + album.id + '">' + album.name + '</a></li>';

      $('.modal-content').append(html);
    });
  }

  function handleError (err1, err2, err3) {
    console.error('OH NO!!', err1, err2, err3);
  }

  albums.done(handleAlbums);
  request.fail(handleError);
}

function fetchTracks(id){
  var albums = $.get('https://api.spotify.com/v1/albums/' + id + '/tracks');


  function handleTracks(tracks){
  console.log(tracks);
    $('.modal-content').empty();
  tracks.items.forEach(function (track){
      var html = '<li><a class="track" target=”_blank” href="' + track.preview_url + '">' + track.name + '</a></li>' ;

      $('.modal-content').append(html);
    });
  }

  function handleError (err1, err2, err3) {
    console.error('OH NO!!', err1, err2, err3);
  }

  albums.done(handleTracks);
  request.fail(handleError);
}
$(document).on('click', '.track', function(){
  event.preventDefault();
  $('modal-content').empty();
  var url = '<video controls="" autoplay="" name="media"><source src="' + $(this).href() + '" type="audio/mpeg"></video>';
  $('modal-content').append(url);
});

$('.btn').on('click', function(){
  $('.results').empty();
  fetchArtists();
});

$(document).on('click','#myModal', function(){

fetchAlbums($(this).data('artist'));

  $('#myInput').modal('show');
});

$(document).on('click', '.album', function(event){
  event.preventDefault();
  console.log($(this).data('album'));
  fetchTracks($(this).data('album'));
});
