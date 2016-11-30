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
        <div id="cipher1">
            <input title="cipher1_id" id="cipher1_id" value="" hidden="hidden"/>
            <div class="progress">
                <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                    20%
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <h1 id="title1">The cipher code is coming soon in</h1>
                    <h4 id="time1"></h4>
                </div>
            </div>
        </div>
        <div id="cipher2">
            <div class="progress">
                <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                    20%
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <h1 id="title2">The cipher code is coming soon in</h1>
                    <h4 id="time2"></h4>
                </div>
            </div>
        </div>
        <div id="cipher3">
            <div class="progress">
                <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                    20%
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <h1 id="title3">The cipher code is coming soon in</h1>
                    <h4 id="time3"></h4>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="layout/foot.jsp"></jsp:include>
<script src="//cdn.bootcss.com/sockjs-client/1.1.1/sockjs.min.js"></script>
<script src="//cdn.bootcss.com/stomp.js/2.3.3/stomp.min.js"></script>
<script>
    $(document).ready(function (){
        $("#nav_home").removeClass("active");
        $("#nav_cipher").addClass("active");
        $("#nav_article").removeClass("active");
        $("#nav_login").removeClass("active");
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
                var ciphers = message.data;
                for (var i = 1; i <= ciphers.length;i++){
                    var cipher = ciphers[i - 1];
                    var trigger = cipher.trigger;
                    var hint1trigger = cipher.hint1trigger;
                    var hint2trigger = cipher.hint2trigger;
                    var hint3trigger = cipher.hint3trigger;
                    //如果该cipher没有设置id并且后台允许，则发送ajax请求cipher
                    if($('#cipher'+ i +'_id').val() == undefined && trigger){
                        console.log('#cipher'+ i +'_id');
                        $('#cipher'+ i +'_id').val(cipher.id);
                        getCipher(cipher.id,i);
                    }else{
                        var time = msec2Date(cipher.remainingMsec);
                        $('#time'+ i).html(time);
                    }
                }
            });
        });
    }
    getCipher = function (id,i) {
        alert(id);
        $.ajax({
            url:"../cipher/"+id+".json",
            type:"GET",
            success:function (result) {
                if (result.code == 200){
                    $('#title'+ i).html(result.data.title);
                }else {
                    alert(result.msg);
                }
            }
        });
    };
    function msec2Date(originMsec){
        var tmpMsec,days,hours,minutes,seconds;
        tmpMsec = originMsec;
        days = Math.floor(tmpMsec / (1000 * 3600 * 24));
        tmpMsec = tmpMsec - days * (1000 * 3600 * 24);
        hours = Math.floor(tmpMsec / (1000 * 3600));
        tmpMsec = tmpMsec - hours * (1000 * 3600);
        minutes = Math.floor(tmpMsec / (1000 * 60));
        tmpMsec = tmpMsec - minutes * (1000 * 60);
        seconds = Math.floor(tmpMsec / (1000));
        return days + " Days " + hours + " Hours " + minutes + " Minutes " + seconds + " Seconds.";
    }
</script>
</body>
</html>
