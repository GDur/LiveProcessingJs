/*var ws = require("websocket-server");

var server = ws.createServer({server:"http.Server"});

server.addListener("connection", function(connection){
  connection.addListener("message", function(msg){
	server.send(msg);
  });
});

server.listen(9999);
*/
var WebSocketServer = require('C:\\Users\\GDur\\node_modules\\websocket').server;
var webSocketsServerPort = 9999;
var http = require('http');
// list of currently connected clients (users)
var clients = [];

var server = http.createServer(function(request, response) {
	// process HTTP request. Since we're writing just WebSockets server
	// we don't have to implement anything.
});

server.listen(webSocketsServerPort, function() {
	console.log((new Date()) + " Server is listening on port " + webSocketsServerPort);
});

// create the server
wsServer = new WebSocketServer({
	httpServer: server
});
// server will close if no message in ~maxTTL seconds
var maxTTL		= 60 * 2; 
var timeToLive	= maxTTL;

setInterval(function(){
	console.log("secs: " + timeToLive);
	if(timeToLive < 0)
		wsServer.close();
	timeToLive--;
}, 1000);

// WebSocket server
wsServer.on('request', function(request) {
	console.log((new Date()) + ' Connection from origin ' + request.origin + '.');
	var connection = request.accept(null, request.origin);

	var index = clients.push(connection) - 1;

	connection.on('message', function(message) {
		timeToLive	= maxTTL;
		console.log("Message:");
		if (message.type === 'utf8') {
			console.log(message.utf8Data);

			if(message.utf8Data === "{close}")
				wsServer.close();

			for (var i=0; i < clients.length; i++) {
				clients[i].sendUTF(message.utf8Data);
			}
		}
	});

	connection.on('close', function(connection) {
		// close user connection
	});
});

/*var net = require('net');
var clients = [];

net.createServer(function (stream) {
	stream.setEncoding('utf8');
	stream.on('data', function (data) {
		// HERE SHOULD BE WS BROADCAST
		for(var i = 0; i < clients.length; i++)
			clients[i].json.send("dd");
		console.log(data);
	});
}).listen(9999);


/*var WebSocketServer = require('ws').Server
, wss = new WebSocketServer({port: 9999});
wss.on('connection', function(ws) {
	function toClient(message) {
		ws.write(message+"");		
	}
	ws.on('message', function(message) {
		var msg = message;
		if(msg === "getCode")
		{
			console.log("lastcode because getCode");
			toClient('console.log("server is working");void setup(){size(600, 600/1.7);smooth();rect(width/2,height/2,10,10);}');
			toClient('console.log("server is working");void setup(){size(600, 600);smooth();rect(width/2,height/2,10,10);}');
		}else
		{
			console.log("SHOULD SEND");
			toClient('console.log("server is WOORKGIFDGworking");void setup(){size(60, 600/1.7);smooth();rect(width/2,height/2,10,10);}');
		}

	});
	//toClient('console.log("server is working");');
	// //ws.send('console.log("server is working");void setup(){size(600, 600/1.7);smooth();rect(width/2,height/2,10,10);}');
});
*/
