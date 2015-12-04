// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

(function main () {
  var isJoining = false

  $('[data-hook~=join-bbq]').on('click', function (event) {
    if (isJoining) {
      return
    }

    isJoining = true
    var $button = $(event.target)
    var bbqId = $button.closest('[data-bbq]').data('bbq')
    var request = $.post('/api/barbecues/' + bbqId + '/join')

    request.fail(function () {
      alert('Couldn’t join the barbecue. Try again later.')
      isJoining = false
    })

    request.done(function () {
      $button.fadeOut()
      isJoining = false
    })
  })



  if ($('[data-hook~=controller-barbecues][data-hook~=action-show]').length) {
    var $bbqContainer = $('[data-hook=bbq-info]')
    var bbqId = $bbqContainer.data('bbq')
    var request = $.get('/api/barbecues/' + bbqId)
    var request2 = $.get('/api/barbecues/' + bbqId + '/itemlist')

    request.fail(function () {
      var htmlParts = [
        '<div class="alert alert-danger" role="alert">',
        '  There was a problem retrieving the BBQ info. Try again later.',
        '</div>'
      ]
      $bbqContainer.append(htmlParts.join('\n'))
    })
    request2.fail(function () {
      var htmlParts = [
        '<div class="alert alert-danger" role="alert">',
        '  There was a problem retrieving the item list.',
        '</div>'
      ]
      $bbqContainer.append(htmlParts.join('\n'))
    })

    request.done(function (bbq) {
      var bbqMoment = moment(bbq.date)
      var htmlParts = [
        '<h2>' + bbq.title + '</h2>',
        '<dl>',
        '  <dt>Date:</dt>',
        '  <dd>' + bbqMoment.format('MMMM, D YYYY [at] h:mm a') + '</dd>',
        '  <dt>Venue:</dt>',
        '  <dd>' + bbq.venue + '</dd>',
        '</dl>'
      ]
      $bbqContainer.append(htmlParts.join('\n'))
    })

    request2.done(function(itemlist){
      if (itemlist){
          itemlist.forEach(function(item){
        $('.itemlist').append('<li>' + item.item_name + '</li>');
                        })
      }
    })
  }
})()

function addItem(item, bbqId){
  var request = $.post('/api/barbecues/' + bbqId + '/itemlist/' + item );
  request.fail(function () {
    var htmlParts = [
      '<div class="alert alert-danger" role="alert">',
      '  Couldnt save the item',
      '</div>'
    ]
  })
  request.done(function(){
    $('.itemlist').append('<li>' + item + '</li>');
  })
};

$(document).ready(function(){
  $('.itemlist').toggle();
});

$(document).on('click', '.js-show-items', function(){
  $('.itemlist').toggle();
});

$(document).on('click', '.js-submit-button', function(){
  console.log('3');
  addItem($('.js-item-input').val(), $('.js-submit-button').data('bbqid'));
          $('.js-item-input').value = "";
})
