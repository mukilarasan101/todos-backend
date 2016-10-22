class NotifyChanges {
	static init(socket){


	    socket.onOpen( ev => console.log("OPEN", ev) )
	    socket.onError( ev => console.log("ERROR", ev) )
	    socket.onClose( e => console.log("CLOSE", e))

	    var chan = socket.channel("pushchanges:lobby", {})
	    chan.join()
	        .receive("ignore", () => console.log("auth error"))
	        .receive("ok", () => console.log("join ok"))
	        .receive("timeout", () => console.log("Connection interruption"))
	    chan.onError(e => console.log("something went wrong", e))
	    chan.onClose(e => console.log("channel closed", e))

	    chan.on("new:msg", msg => {
	    	//debugger;
	    	var store = Todo.__container__.lookup("service:store");
	    	if(msg.operation==="new"){
	    		store.pushPayload(msg.type, msg.data);
	    	}else if(msg.operation==="delete"){
	    		store.find(msg.type, msg.data[msg.type].id).then(function (record) {
					record.unloadRecord();
				});
	    	}else if(msg.operation==="edit"){
	    		store.find(msg.type, msg.data[msg.type].id).then(function (record) {
	    			var myJsonObj = msg.data[msg.type];
					for (var key in myJsonObj) {
						if (myJsonObj.hasOwnProperty(key)) {
							var val = myJsonObj[key];
							debugger;
							record.set(key,val);
						}
					}

				});
	    	}
	        console.log(msg);
	        scrollTo(0, document.body.scrollHeight)
	    })

    }
}
export default NotifyChanges