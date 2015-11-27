// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


PokemonApp.Pokemon = function (pokemonUri) {
  this.id = PokemonApp.Pokemon.idFromUri(pokemonUri);
};

PokemonApp.Pokemon.prototype.render = function () {
  console.log("Rendering pokemon: #" + this.id);
  var self = this;

  function  getSprite(uri){
     $.get(uri, function(sprite){
         var imageUrl = '"http://pokeapi.co/'+ sprite.image + '"';
         console.log(imageUrl);
         $('.js-pkmn-image').html('<img src=' + imageUrl + '>');
         });
  };


  $.ajax({
    url: "/api/pokemon/" + this.id,
    success: function (response) {
      self.info = response;
      var types = [];

      console.log("Pokemon info:");
      console.log(self.info);

        $(".js-pkmn-name").text(self.info.name);
        $(".js-pkmn-number").text(self.info.pkdx_id);
        $(".js-pkmn-height").text(self.info.height);
        $(".js-pkmn-weight").text(self.info.weight);
        $(".js-pkmn-hp").text(self.info.hp);
        $(".js-pkmn-attack").text(self.info.attack);
        $(".js-pkmn-defense").text(self.info.defense);
        $(".js-pkmn-sp_atk").text(self.info.sp_atk);
        $(".js-pkmn-sp_def").text(self.info.sp_def);
        $(".js-pkmn-speed").text(self.info.speed);
        self.info.types.forEach(function(object){
            types.push(' '+object.name);
        });
        $(".js-pkmn-types").text(types);
          if(self.info.evolutions[0] == null){
            $(".js-pkmn-evolution").text('No evolutions');
            $(".evolutions").html('<p>NO EVOLUTIONS</p>');
              }else {
            $(".js-pkmn-evolution").text(self.info.evolutions[0].to + ' at level ' + self.info.evolutions[0].level);
              var buttonHtml =   '<button type="btn" class="evoButton" name="button">Evolutions</button>';
              $('.evoButton').remove();
              if(self.info.evolutions[0].resource_uri){
                $.get(self.info.evolutions[0].resource_uri, function(evo1){
                  if (evo1.sprites[0].resource_uri) {
                  $.get(evo1.sprites[0].resource_uri, function(sprite){
                      console.log(sprite);
                      var imageUrl = '<a href="#"><img class="evolutionPokemon" data-uri="' + evo1.resource_uri +  '" src="http://pokeapi.co/'+ sprite.image + '"><br></a>';
                      $('.evolutions').html(imageUrl);

                  });}
                  if(evo1.evolutions[0].resource_uri){
                    $.get(evo1.evolutions[0].resource_uri, function(evo2){
                      if (evo2.sprites[0].resource_uri) {
                      $.get(evo2.sprites[0].resource_uri, function(sprite){
                          console.log(sprite);
                          var imageUrl = '<a href="#"><img class="evolutionPokemon" data-uri="' + evo2.resource_uri +  '" src="http://pokeapi.co/'+ sprite.image + '"><br></a>';
                          $('.evolutions').append(imageUrl);

                      });}
                    });
                  }
                });
              }
              $('.modal-body').append(buttonHtml);
                    }


        if (self.info.sprites[0].resource_uri) {
            getSprite(self.info.sprites[0].resource_uri);
        //    $('.js-pkmn-image').html('<img src=' + getSprite(self.info.sprites[0].resource_uri) + '>');
                                                }
        $.get(self.info.descriptions[self.info.descriptions.length -1].resource_uri, function(description){
          console.log(description);
          var descriptionHtml = '<p>' + description.description + '</p>';
          $('.js-pkmn-description').html(descriptionHtml);
        });
        //addImg(self.info.pkdex_id);

        $(".js-pokemon-modal").modal("show");
    }
  });

};




PokemonApp.Pokemon.idFromUri = function (pokemonUri) {
  var uriSegments = pokemonUri.split("/");
  var secondLast = uriSegments.length - 2;
  return uriSegments[secondLast];
};

$(document).on("ready", function () {
  $('.evolutions').toggle();
  $(".js-show-pokemon").on("click", function (event) {
    var $button = $(event.currentTarget);
    var pokemonUri = $button.data("pokemon-uri");

    var pokemon = new PokemonApp.Pokemon(pokemonUri);
    pokemon.render();
  });

});

$(document).on('click', '.evoButton', function(){
  $('.evolutions').toggle();
});

$(document).on('click', '.evolutionPokemon', function(){
  event.preventDefault;
  var data = $(event.target).data('uri');
  var pokemon = new PokemonApp.Pokemon(data);
  pokemon.render();
});
