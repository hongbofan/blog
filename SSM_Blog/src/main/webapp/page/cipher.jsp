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
    <jsp:include page="layout/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="layout/nav.jsp"></jsp:include>
<noscript>
    <h2 style="color: #ff0000">不支持的浏览器版本,丫的是不是用IE了,你这简直是摧残程序员的生命</h2>
</noscript>

    <div class="container">

        <div class="page-header">
            <h1 class="demo-headline">CIPHERS</h1>
            <h1> Imagine <small>Discover&Explore</small></h1>
        </div>
        <h1>The cipher code is coming soon in</h1>
        <h4 id="time"></h4>
    </div>
<jsp:include page="layout/foot.jsp"></jsp:include>
<script src="//cdn.bootcss.com/sockjs-client/1.1.1/sockjs.min.js"></script>
<script src="//cdn.bootcss.com/stomp.js/2.3.3/stomp.min.js"></script>
<script>
    $(document).ready(function (){
        $("#nav_home").removeClass("active");
        $("#nav_cipher").addClass("active");
        $("#nav_article").removeClass("active");
        connect();
    });
</script>
<script>
    var stompClient = null;
    function connect() {
        var socket = new SockJS('/webSocket/hello.htm');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function(frame) {
            console.log('Connected: ' + frame);
            stompClient.subscribe('/subscribe/time', function(greeting){
                console.log(greeting);
                var message = JSON.parse(greeting.body);
                $('#time').html(message.days +" days " + message.hours + " hours " + message.minutes + " minutes " + message.seconds + " seconds");
            });
        });
    }
</script>
</body>
</html>
