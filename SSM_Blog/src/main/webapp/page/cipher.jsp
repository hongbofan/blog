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
    <style>
        *{
            word-break:break-all;
        }
        #cipher1_content img{
            display: block;width: 100%;height: auto;
        }
        #cipher2_content img{
            display: block;width: 100%;height: auto;
        }
        #cipher3_content img{
            display: block;width: 100%;height: auto;
        }
        #cipher1_title{
            font-size: 3.0vw;
        }
        #cipher2_title{
            font-size: 3.0vw;
        }
        #cipher3_title{
            font-size: 3.0vw;
        }
    </style>
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
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div id="cipher1_hints" class="col-lg-4 col-sm-4 col-md-4 col-xs-4">
                            <div id="cipher1_hint1">
                                <div class="progress" style="margin-bottom: 0px">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        20%
                                    </div>
                                </div>
                                <input title="cipher1_hint1_id" id="cipher1_hint1_id" value="" hidden="hidden"/>
                                <div id="cipher1_hint1_content">hint1:0 : 0 : 0 : 0</div>
                            </div>
                            <div id="cipher1_hint2">
                                <div class="progress" style="margin-bottom: 0px">
                                    <div class="progress-bar progress-bar-success " role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        20%
                                    </div>
                                </div>
                                <input title="cipher1_hint2_id" id="cipher1_hint2_id" value="" hidden="hidden"/>
                                <div id="cipher1_hint2_content">hint2:0 : 0 : 0 : 0</div>
                            </div>
                            <div id="cipher1_hint3">
                                <div class="progress" style="border-radius: 4px;margin-bottom: 0px">
                                    <div class="progress-bar progress-bar-striped " role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        20%
                                    </div>
                                </div>
                                <input title="cipher1_hint3_id" id="cipher1_hint3_id" value="" hidden="hidden"/>
                                <div id="cipher1_hint3_content">hint3:0 : 0 : 0 : 0</div>
                            </div>

                        </div>
                        <div id="cipher1_title_content" class="col-lg-8 col-sm-8 col-md-8 col-xs-8">
                            <div class="progress" style="margin-bottom: 0px">
                                <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                    20%
                                </div>
                            </div>
                            <h4 id="cipher1_title" class="text-center">The cipher code is coming soon in</h4>
                            <div id="cipher1_content">
                                0 Days 0 Hours 0 Minutes 0 Seconds
                                <!--                            <img src="../assert/img/img_logo-25ff4bee2e56411470b83c636a7a0dad.png">-->
                                <img src="../assert/img/d19a402524f4638a6759c53120a951b0.jpg">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="input-group col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4 col-sm-4 col-sm-offset-4 col-xs-6 col-xs-offset-3">
                        <input type="text" class="form-control" placeholder="input answer" id="cipher1_answer">
                        <span class="input-group-btn">
                            <button type="submit" class="btn" onclick="answer1()" id="cipher1_search_button"><span class="fa fa-paper-plane"></span></button>
                    </span>
                    </div>
                </div>
            </div>
        </div>
        <div id="cipher2">
            <input title="cipher2_id" id="cipher2_id" value="" hidden="hidden"/>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div id="cipher2_hints" class="col-lg-4 col-sm-4 col-md-4 col-xs-4">
                            <div id="cipher2_hint1">
                                <div class="progress" style="margin-bottom: 0px">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        20%
                                    </div>
                                </div>
                                <input title="cipher2_hint1_id" id="cipher2_hint1_id" value="" hidden="hidden"/>
                                <div id="cipher2_hint1_content">hint1:0 : 0 : 0 : 0</div>
                            </div>
                            <div id="cipher2_hint2">
                                <div class="progress" style="margin-bottom: 0px">
                                    <div class="progress-bar progress-bar-success " role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        20%
                                    </div>
                                </div>
                                <input title="cipher2_hint2_id" id="cipher2_hint2_id" value="" hidden="hidden"/>
                                <div id="cipher2_hint2_content">hint2:0 : 0 : 0 : 0</div>
                            </div>
                            <div id="cipher2_hint3">
                                <div class="progress" style="border-radius: 4px;margin-bottom: 0px">
                                    <div class="progress-bar progress-bar-striped " role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        20%
                                    </div>
                                </div>
                                <input title="cipher2_hint3_id" id="cipher2_hint3_id" value="" hidden="hidden"/>
                                <div id="cipher2_hint3_content">hint3:0 : 0 : 0 : 0</div>
                            </div>

                        </div>
                        <div id="cipher2_title_content" class="col-lg-8 col-sm-8 col-md-8 col-xs-8">
                            <div class="progress" style="margin-bottom: 0px">
                                <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                    20%
                                </div>
                            </div>
                            <h4 id="cipher2_title" class="text-center">The cipher code is coming soon in</h4>
                            <div id="cipher2_content">
                                0 Days 0 Hours 0 Minutes 0 Seconds
                                <!--                            <img src="../assert/img/img_logo-25ff4bee2e56411470b83c636a7a0dad.png">-->
                                <img src="../assert/img/d19a402524f4638a6759c53120a951b0.jpg">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="input-group col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4 col-sm-4 col-sm-offset-4 col-xs-6 col-xs-offset-3">
                        <input type="text" class="form-control" placeholder="input answer" id="cipher2_answer">
                        <span class="input-group-btn">
                            <button type="submit" class="btn" onclick="answer2()" id="cipher2_search_button"><span class="fa fa-paper-plane"></span></button>
                    </span>
                    </div>
                </div>
            </div>
        </div>
        <div id="cipher3">
            <input title="cipher3_id" id="cipher3_id" value="" hidden="hidden"/>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div id="cipher3_hints" class="col-lg-4 col-sm-4 col-md-4 col-xs-4">
                            <div id="cipher3_hint1">
                                <div class="progress" style="margin-bottom: 0px">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        20%
                                    </div>
                                </div>
                                <input title="cipher3_hint1_id" id="cipher3_hint1_id" value="" hidden="hidden"/>
                                <div id="cipher3_hint1_content">hint1:0 : 0 : 0 : 0</div>
                            </div>
                            <div id="cipher3_hint2">
                                <div class="progress" style="margin-bottom: 0px">
                                    <div class="progress-bar progress-bar-success " role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        20%
                                    </div>
                                </div>
                                <input title="cipher3_hint2_id" id="cipher3_hint2_id" value="" hidden="hidden"/>
                                <div id="cipher3_hint2_content">hint2:0 : 0 : 0 : 0</div>
                            </div>
                            <div id="cipher3_hint3">
                                <div class="progress" style="border-radius: 4px;margin-bottom: 0px">
                                    <div class="progress-bar progress-bar-striped " role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        20%
                                    </div>
                                </div>
                                <input title="cipher3_hint3_id" id="cipher3_hint3_id" value="" hidden="hidden"/>
                                <div id="cipher3_hint3_content">hint3:0 : 0 : 0 : 0</div>
                            </div>

                        </div>
                        <div id="cipher3_title_content" class="col-lg-8 col-sm-8 col-md-8 col-xs-8">
                            <div class="progress" style="margin-bottom: 0px">
                                <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                    20%
                                </div>
                            </div>
                            <h4 id="cipher3_title" class="text-center">The cipher code is coming soon in</h4>
                            <div id="cipher3_content">
                                0 Days 0 Hours 0 Minutes 0 Seconds
                                <!--                            <img src="../assert/img/img_logo-25ff4bee2e56411470b83c636a7a0dad.png">-->
                                <img src="../assert/img/d19a402524f4638a6759c53120a951b0.jpg">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="input-group col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4 col-sm-4 col-sm-offset-4 col-xs-6 col-xs-offset-3">
                        <input type="text" class="form-control" placeholder="input answer" id="cipher3_answer">
                        <span class="input-group-btn">
                            <button type="submit" class="btn" onclick="answer3()" id="cipher3_search_button"><span class="fa fa-paper-plane"></span></button>
                    </span>
                    </div>
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
                    var triggers = [cipher.trigger,cipher.hint1trigger,cipher.hint2trigger,cipher.hint3trigger];
                    var times = [cipher.remainingMsec,cipher.fhintRemainingMsec,cipher.shintRemainingMsec,cipher.thintRemainingMsec];
                    //如果该cipher没有设置id并且后台允许，则发送ajax请求cipher
                    if($('#cipher'+ i +'_id').val() == "" && triggers[0]){
                        console.log('#cipher'+ i +'_id');
                        $('#cipher'+ i +'_id').val(cipher.id);
                        getCipher(cipher.id,i);
                    }else if($('#cipher'+ i +'_id').val() == "" && !triggers[0]){
                        var time = msec2Date(times[0]);
                        $('#cipher'+ i + '_content').html(time);
                    }
                    for(var j = 1;j <= 3;j++){
                        if($('#cipher'+ i +'_hint' + j + '_id').val() == "" && triggers[j]){
                            console.log('#cipher'+ i +'_hint' + j + '_id');
                            $('#cipher'+ i +'_hint' + j + '_id').val(cipher.id);
                            getHint(cipher.id,i,j);
                        }else if ($('#cipher'+ i +'_hint' + j + '_id').val() == "" && !triggers[j]){
                            $('#cipher'+ i + '_hint' + j + '_content').html(msec2Date(times[j]));
                        }
                    }

                }
            });
        });
    }
    answer = function (answer,id) {
        if(id == ""){
            alert("This cipher is unreachable.");
            return;
        }
        if(answer == ""){
            alert("Input answer please.");
            return;
        }
        $.ajax({
            url:"../cipher/"+id+"/answer.json",
            data:{answer:answer},
            type:"POST",
            success:function (result) {
                alert(result.msg);
            }
        });
    };
    answer1 = function () {
        var cipher1_answer = $('#cipher1_answer').val();
        var id = $('#cipher1_id').val();
        answer(cipher1_answer,id);
    };
    answer2 = function () {
        var cipher2_answer = $('#cipher2_answer').val();
        var id = $('#cipher2_id').val();
        answer(cipher2_answer,id);
    };
    answer3 = function () {
        var cipher3_answer = $('#cipher3_answer').val();
        var id = $('#cipher3_id').val();
        answer(cipher3_answer,id);
    };

    getHint = function (id,i,j) {
        alert(id+","+ i +","+ j);
        $.ajax({
            url:"../cipher/"+id+"/hint.json?hint="+j,
            type:"GET",
            success:function (result) {
                if(result.code == 200){
                    $('#cipher'+ i +'_hint' + j + '_content').html("hint"+ j + result.data);
                }else {
                    alert(result.msg);
                }
            }
        });
    };
    getCipher = function (id,i) {
        alert(id+','+i);
        $.ajax({
            url:"../cipher/"+id+".json",
            type:"GET",
            success:function (result) {
                if (result.code == 200){
                    $('#cipher'+ i + '_title').html(result.data.title);
                    $('#cipher'+ i + '_content').html(result.data.content);
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
