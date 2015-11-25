var phrasesdb = [
  'Draw me like one of your french fries',
  'The cake is a lie',
  'Supercalifragilisticoespialidoso',
  'Cant get no satisfaction',
  'Who wants a lollypop'
];

function randomPhrase() {
var rand = phrasesdb[Math.floor(Math.random() * phrasesdb.length)];
return rand;
}

function printPhrase(phrase){
  $('p').empty();
  $('p').prepend(phrase);
};

$('.btn.btn-danger').on('click', function(){
  printPhrase(randomPhrase());
});

$('.btn.btn-success').on('click', function(){
  $('ul').toggle(1000);
});

$('.form1').on('submit', function(event){
  event.preventDefault();
  phrasesdb.push($('input').val());
  printPhrase($('input').val())
  generatePhrases();
  $('input').value = "";
});

function generatePhrases(){
$('ul').empty();
phrasesdb.forEach(function(entry,index) {

  var phrase = '<li class="'index'">"+entry+"</li>';

    $('.phrasesarea').append(phrase);
});
}

printPhrase(randomPhrase());
generatePhrases();
