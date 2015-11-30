function deleteTournament(event){
  event.preventDefault;

  var tournamentId = parseInt(event.currentTarget.value);
  var $tourneySection = $('.js-tourney-section');

  console.log(tournamentId);

  var request = $.ajax({
        url: '/api/tournaments',
        type: 'DELETE',
        data: {id: tournamentId},
      });

  function handleError (err1, err2, err3) {
    console.error('OH NO!!', err1, err2, err3);
  }

  function redirectToIndex() {
    $('.tourney-list').empty();
    tournamentsIndex();
  }
      request.done(redirectToIndex);
      request.fail(handleError);
};
