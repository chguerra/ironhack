var net = require('net');
var hash = {};
var port = 11312;
var server = net.createServer(function(connection) {
    console.log('Connection to %s open', port);
    connection.on('data', function(data) {
        var command = String(data).trim().split(" ");
        var orden = command[0].toUpperCase();
       if (orden == "SET"){
       		var key = command[1];
       		var value = command.slice(2).join(" ");
			hash[key] = value;
			connection.write("STORED\r\n");
       } else if (orden == "GET"){
       		var key = command[1];
       		connection.write("VALUE "+hash[key]+"\r\n");
       } else {
       		connection.write("END\n\r");
       }

    });
});
server.listen(port);
	