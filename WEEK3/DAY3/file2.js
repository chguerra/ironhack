function ticketBuilder(transport) {
return function(name) {
    		console.log("Welcome, " + name + ". Here is your ticket for the " + transport);
}
}


var getPlaneTicket = ticketBuilder("plane");
var getTrainTicket = ticketBuilder("train");
var getMilleniumFalconTicket = ticketBuilder("Millenium Falcon");

getPlaneTicket("John Smith");
getPlaneTicket("Patty Bishop");
getTrainTicket("John Doe");
getMilleniumFalconTicket("Han Solo");
