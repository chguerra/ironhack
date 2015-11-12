function ticketBuilder(transport) {
	var passengerNumber = 0;    
return function(name) {
	passengerNumber ++;
    		console.log("Welcome, " + name + ". Here is your ticket for the " + transport +
" You are passenger #" + passengerNumber + "." );
}
}
var getPlaneTicket = ticketBuilder("plane");
var getTrainTicket = ticketBuilder("train");

getPlaneTicket("John Smith");
getPlaneTicket("Patty Bishop");
getPlaneTicket("Patty Bishop");
getTrainTicket("Patty Bishop");


//TESTING JAVASCRIPT JASMINE
//TESTING NODE MODE