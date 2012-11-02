$(function() {

	if ("WebSocket" in window)
	{
		//trace("WebSocket is supported by your Browser!");
		// Let us open a web socket
		websocket = "ws://localhost:9999/ws";

		if (window.WebSocket) {
			ws = new WebSocket(websocket);
		}
		else if (window.MozWebSocket) {
			ws = MozWebSocket(websocket);
		}
		else {
			log('WebSocket Not Supported');
			return;
		}

		ws.onopen = function()
		{
			log("Connection is established...waiting for code. Nothing happens?: open a .pde file with Sublime to see results.");
			ws.send("getCode");
			$("#canvasContainer").html("<canvas id='canvas' tabindex='0'></canvas>");
			//ws.send("poll");
		};
		ws.onmessage = function (evt) 
		{ 			
			var received_msg = evt.data;
			sourceCode =  received_msg + ";";
			if(sourceCode === "getCode;"){
			}else{
				$("#canvasContainer").html("<canvas id='canvas' tabindex='0'></canvas>");
				//sourceCode = "int num = 60;float mx[] = new float[num];float my[] = new float[num];void setup() {  size(200, 200);  smooth();  noStroke();  fill(255, 153); }void draw() {  background(51); for(int i=1; i<num; i++) {  mx[i-1] = mx[i];    my[i-1] = my[i];  }  mx[num-1] = mouseX;  my[num-1] = mouseY;for(int i=0; i<num; i++) {ellipse(mx[i], my[i], i/2, i/2);}}"

				var canvas = document.getElementById("canvas");
				var p = new Processing(canvas, sourceCode);

				log("Sourcecode recieved");
			}
		};
		ws.onclose = function()
		{ 
			log("Connection is closed...restart the Server socket by changing the code in sublime"); 
		};
	}
	else
	{
		log("WebSocket NOT supported by your Browser!");
	}
	log("working");
});