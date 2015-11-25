$(document).on('ready',function(){
  $('#pizza').find('.crust').removeClass('crust-gluten-free');
  $('#pizza').find('.crust').removeClass('sauce-white');
  $('.panel.controls').find('.btn-crust').toggleClass('active');
  $('.panel.controls').find('.btn-sauce').toggleClass('active');
  updateIngredientsList('crust-gluten-free');
  updateIngredientsList('sauce-white');
});

$('.btn').on('click', function(event){
  var btn = $(event.currentTarget);
  var pizza = $('#pizza');

  if (btn.hasClass("btn-sauce")) {
    pizza.find('.sauce').toggleClass('sauce-white');
  }else if (btn.hasClass("btn-crust")) {
    pizza.find('.crust').toggleClass('crust-gluten-free');
  } else {
      addOrRemoveIngredient(btn.data("ingredient"));
  }

  updateIngredientsList(btn.data("ingredient"));
  btn.toggleClass('active');
  updatePrice(btn);
});

function addOrRemoveIngredient(ingredient) {
  var pizza = $('#pizza');
  pizza.find("."+ingredient).toggle();
}

function updateIngredientsList(ingredient){
  var ingredients = $(".panel.price").find("ul");
  ingredients.find(".list-"+ingredient).toggle();
}

function updatePrice(target) {
  var totalAmount = $(".panel.price").find("strong");

  var currentPrice = parseInt(totalAmount.data("price"));
  var price = parseInt(target.data("price"));

  if(target.hasClass("active")) {
    currentPrice += price;
  } else {
    currentPrice -= price;
  }

  totalAmount.data("price", currentPrice);
  totalAmount.text("$" + currentPrice);
}

$('form-control').on('click', function(){
    $('spotifysearch').addClass('spotifysearch2');
});
