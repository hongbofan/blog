<%--
  Created by IntelliJ IDEA.
  User: hongbofan
  Date: 2016/10/26
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="//cdn.bootcss.com/sockjs-client/1.1.1/sockjs.min.js"></script>
    <script src="//cdn.bootcss.com/stomp.js/2.3.3/stomp.min.js"></script>
    <script>
        var stompClient = null;

        function setConnected(connected) {
            document.getElementById('connect').disabled = connected;
            document.getElementById('disconnect').disabled = !connected;
            document.getElementById('conversationDiv').style.visibility =
                    connected ? 'visible' : 'hidden';
            document.getElementById('response').innerHTML = '';
        }

        function connect() {
            var socket = new SockJS('/hello.htm');
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function(frame) {
                setConnected(true);
                console.log('Connected: ' + frame);
                stompClient.subscribe('/tweet/fuck', function(greeting){
                    showGreeting(JSON.parse(greeting.body).code+" : "+
                            JSON.parse(greeting.body).message);
                });
            });
        }

        function disconnect() {
            if (stompClient != null) {
                stompClient.disconnect();
            }
            setConnected(false);
            console.log("Disconnected");
        }

        function sendMessage() {
            var message = document.getElementById('message').value;
            stompClient.send("/websocket/hello", {}, JSON.stringify({ 'message': message }));
        }

        function showGreeting(message) {
            var response = document.getElementById('response');
            var p = document.createElement('p');
            p.style.wordWrap = 'break-word';
            p.appendChild(document.createTextNode(message));
            response.appendChild(p);
        }
    </script>
</head>
<body onload="disconnect()">
<noscript>
    <h2 style="color: #ff0000">不支持的浏览器版本,丫的是不是用IE了,你这简直是摧残程序员的生命</h2>
</noscript>
<hr/>

<p>这只是一个SpringMVC的websocket例子</p>

<div>
    <div>
        <button id="connect" onclick="connect();">连接</button>
        <button id="disconnect" disabled="disabled" onclick="disconnect();">
            断开连接</button>
    </div>
    <div id="conversationDiv">
        <label>你要说什么</label><input type="text" id="message" />
        <button id="sendMessage" onclick="sendMessage();">发送</button>
        <p id="response"></p>
    </div>
</div>
<hr/>
</body>
</html>
