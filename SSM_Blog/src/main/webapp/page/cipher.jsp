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
        #cipher4_content img{
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
        #cipher4_title{
            font-size: 3.0vw;
        }
        .login-dialog .modal-dialog {
            width: 300px;
        }
        .container {
            opacity: 0.9;
        }
    </style>
    <link rel="stylesheet" href="../assert/css/canvas.css">
</head>
<body>
<jsp:include page="layout/nav.jsp"></jsp:include>
<noscript>
    <h2 style="color: #ff0000">不支持的浏览器版本,丫的是不是用IE了,你这简直是摧残程序员的生命</h2>
</noscript>

    <div class="container">

        <div class="page-header">
            <canvas id="canvas" width="200%">您的浏览器不支持 HTML5 canvas 标签。</canvas>
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
                                    <div id="cipher1_hint1_progress" class="progress-bar progress-bar-warning" role="progressbar"aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                        0%
                                    </div>
                                </div>
                                <input title="cipher1_hint1_id" id="cipher1_hint1_id" value="" hidden="hidden"/>
                                <div id="cipher1_hint1_content">hint1:0 : 0 : 0 : 0</div>
                            </div>
                            <div id="cipher1_hint2">
                                <div class="progress" style="margin-bottom: 0px">
                                    <div id="cipher1_hint2_progress" class="progress-bar progress-bar-success " role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                        0%
                                    </div>
                                </div>
                                <input title="cipher1_hint2_id" id="cipher1_hint2_id" value="" hidden="hidden"/>
                                <div id="cipher1_hint2_content">hint2:0 : 0 : 0 : 0</div>
                            </div>
                            <div id="cipher1_hint3">
                                <div class="progress" style="border-radius: 4px;margin-bottom: 0px">
                                    <div id="cipher1_hint3_progress" class="progress-bar progress-bar-striped " role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                        0%
                                    </div>
                                </div>
                                <input title="cipher1_hint3_id" id="cipher1_hint3_id" value="" hidden="hidden"/>
                                <div id="cipher1_hint3_content">hint3:0 : 0 : 0 : 0</div>
                            </div>

                        </div>
                        <div id="cipher1_title_content" class="col-lg-8 col-sm-8 col-md-8 col-xs-8">
                            <div class="progress" style="margin-bottom: 0px">
                                <div id="cipher1_progress" class="progress-bar progress-bar-info progress-bar-striped" role="progressbar"  aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                    0%
                                </div>
                            </div>
                            <h4 id="cipher1_title" class="text-center">The cipher code is coming soon in</h4>
                            <div id="cipher1_content"></div>
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
                                    <div id="cipher2_hint1_progress" class="progress-bar progress-bar-warning" role="progressbar"aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                        0%
                                    </div>
                                </div>
                                <input title="cipher2_hint1_id" id="cipher2_hint1_id" value="" hidden="hidden"/>
                                <div id="cipher2_hint1_content">hint1:0 : 0 : 0 : 0</div>
                            </div>
                            <div id="cipher2_hint2">
                                <div class="progress" style="margin-bottom: 0px">
                                    <div id="cipher2_hint2_progress" class="progress-bar progress-bar-success " role="progressbar"aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                        0%
                                    </div>
                                </div>
                                <input title="cipher2_hint2_id" id="cipher2_hint2_id" value="" hidden="hidden"/>
                                <div id="cipher2_hint2_content">hint2:0 : 0 : 0 : 0</div>
                            </div>
                            <div id="cipher2_hint3">
                                <div class="progress" style="border-radius: 4px;margin-bottom: 0px">
                                    <div id="cipher2_hint3_progress" class="progress-bar progress-bar-striped " role="progressbar"aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                        0%
                                    </div>
                                </div>
                                <input title="cipher2_hint3_id" id="cipher2_hint3_id" value="" hidden="hidden"/>
                                <div id="cipher2_hint3_content">hint3:0 : 0 : 0 : 0</div>
                            </div>

                        </div>
                        <div id="cipher2_title_content" class="col-lg-8 col-sm-8 col-md-8 col-xs-8">
                            <div class="progress" style="margin-bottom: 0px">
                                <div id="cipher2_progress" class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                    0%
                                </div>
                            </div>
                            <h4 id="cipher2_title" class="text-center">The cipher code is coming soon in</h4>
                            <div id="cipher2_content"></div>
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
                                    <div id="cipher3_hint1_progress" class="progress-bar progress-bar-warning" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                        0%
                                    </div>
                                </div>
                                <input title="cipher3_hint1_id" id="cipher3_hint1_id" value="" hidden="hidden"/>
                                <div id="cipher3_hint1_content">hint1:0 : 0 : 0 : 0</div>
                            </div>
                            <div id="cipher3_hint2">
                                <div class="progress" style="margin-bottom: 0px">
                                    <div id="cipher3_hint2_progress" class="progress-bar progress-bar-success " role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                        0%
                                    </div>
                                </div>
                                <input title="cipher3_hint2_id" id="cipher3_hint2_id" value="" hidden="hidden"/>
                                <div id="cipher3_hint2_content">hint2:0 : 0 : 0 : 0</div>
                            </div>
                            <div id="cipher3_hint3">
                                <div class="progress" style="border-radius: 4px;margin-bottom: 0px">
                                    <div id="cipher3_hint3_progress" class="progress-bar progress-bar-striped " role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                        0%
                                    </div>
                                </div>
                                <input title="cipher3_hint3_id" id="cipher3_hint3_id" value="" hidden="hidden"/>
                                <div id="cipher3_hint3_content">hint3:0 : 0 : 0 : 0</div>
                            </div>

                        </div>
                        <div id="cipher3_title_content" class="col-lg-8 col-sm-8 col-md-8 col-xs-8">
                            <div class="progress" style="margin-bottom: 0px">
                                <div id="cipher3_progress" class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                    0%
                                </div>
                            </div>
                            <h4 id="cipher3_title" class="text-center">The cipher code is coming soon in</h4>
                            <div id="cipher3_content"></div>
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
        <div id="cipher4">
            <input title="cipher4_id" id="cipher4_id" value="" hidden="hidden"/>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div id="cipher4_hints" class="col-lg-4 col-sm-4 col-md-4 col-xs-4">
                            <div id="cipher4_hint1">
                                <div class="progress" style="margin-bottom: 0px">
                                    <div id="cipher4_hint1_progress" class="progress-bar progress-bar-warning" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                        0%
                                    </div>
                                </div>
                                <input title="cipher3_hint1_id" id="cipher4_hint1_id" value="" hidden="hidden"/>
                                <div id="cipher4_hint1_content">hint1:0 : 0 : 0 : 0</div>
                            </div>
                            <div id="cipher4_hint2">
                                <div class="progress" style="margin-bottom: 0px">
                                    <div id="cipher4_hint2_progress" class="progress-bar progress-bar-success " role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                        0%
                                    </div>
                                </div>
                                <input title="cipher4_hint2_id" id="cipher4_hint2_id" value="" hidden="hidden"/>
                                <div id="cipher4_hint2_content">hint2:0 : 0 : 0 : 0</div>
                            </div>
                            <div id="cipher4_hint3">
                                <div class="progress" style="border-radius: 4px;margin-bottom: 0px">
                                    <div id="cipher4_hint3_progress" class="progress-bar progress-bar-striped " role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                        0%
                                    </div>
                                </div>
                                <input title="cipher3_hint3_id" id="cipher4_hint3_id" value="" hidden="hidden"/>
                                <div id="cipher4_hint3_content">hint3:0 : 0 : 0 : 0</div>
                            </div>

                        </div>
                        <div id="cipher4_title_content" class="col-lg-8 col-sm-8 col-md-8 col-xs-8">
                            <div class="progress" style="margin-bottom: 0px">
                                <div id="cipher4_progress" class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                    0%
                                </div>
                            </div>
                            <h4 id="cipher4_title" class="text-center">The cipher code is coming soon in</h4>
                            <div id="cipher4_content"></div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="input-group col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4 col-sm-4 col-sm-offset-4 col-xs-6 col-xs-offset-3">
                        <input type="text" class="form-control" placeholder="input answer" id="cipher4_answer">
                        <span class="input-group-btn">
                            <button type="submit" class="btn" onclick="answer4()" id="cipher4_search_button"><span class="fa fa-paper-plane"></span></button>
                    </span>
                    </div>
                </div>
            </div>
        </div>

    </div>

<jsp:include page="layout/foot.jsp"></jsp:include>
<script src="//cdn.bootcss.com/sockjs-client/1.1.1/sockjs.min.js"></script>
<script src="//cdn.bootcss.com/stomp.js/2.3.3/stomp.min.js"></script>
<script src="../assert/common/require.js" data-main="../assert/common/fall-ball.js" type="text/javascript"></script>
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
            //console.log('Connected: ' + frame);
            stompClient.subscribe('/subscribe/cipher', function(greeting){
                //console.log(greeting);
                var message = JSON.parse(greeting.body);
                var ciphers = message.data;
                for (var i = 1; i <= ciphers.length;i++){
                    var cipher = ciphers[i - 1];
                    var triggers = [cipher.trigger,cipher.hint1trigger,cipher.hint2trigger,cipher.hint3trigger];
                    var times = [cipher.remainingMsec,cipher.fhintRemainingMsec,cipher.shintRemainingMsec,cipher.thintRemainingMsec];
                    //如果该cipher没有设置id并且后台允许，则发送ajax请求cipher
                    if($('#cipher'+ i +'_id').val() == "" && triggers[0]){
                        //console.log('#cipher'+ i +'_id');
                        $('#cipher'+ i +'_id').val(cipher.id);
                        getCipher(cipher.id,i);
                    }else if($('#cipher'+ i +'_id').val() == "" && !triggers[0]){
                        var time = msec2Date(times[0]);
                        $('#cipher'+ i + '_content').html(time);
                    }
                    for(var j = 1;j <= 3;j++){
                        if($('#cipher'+ i +'_hint' + j + '_id').val() == "" && triggers[j]){
                            //console.log('#cipher'+ i +'_hint' + j + '_id');
                            $('#cipher'+ i +'_hint' + j + '_id').val(cipher.id);
                            getHint(cipher.id,i,j);
                        }else if ($('#cipher'+ i +'_hint' + j + '_id').val() == "" && !triggers[j]){
                            $('#cipher'+ i + '_hint' + j + '_content').html(msec2Date(times[j]));
                        }

                    }
                    setProgress(cipher,i);
                }
            });
        });
    }
    var startTimeStamp = new Date('2016/12/1 0:0:0').getTime();
    var hoursTimeStamp = 1000*60*60;
    //设置进度条
    setProgress = function (cipher,i) {
        var currentHours = (new Date().getTime() - startTimeStamp)/hoursTimeStamp;
        var publishHours = (cipher.publishTime - startTimeStamp)/hoursTimeStamp;
        var progress = Math.floor(currentHours / publishHours * 100) + "%";
        //console.log(currentHours+","+ publishHours+","+ progress);
        if(cipher.trigger){
            $('#cipher'+i+'_progress').html('100%');
            $('#cipher'+i+'_progress').css('width','100%');
        }else{
            $('#cipher'+i+'_progress').html(progress);
            $('#cipher'+i+'_progress').css('width', progress);
        }
        var hint1progress = Math.floor((currentHours - publishHours) / 6 * 100) + "%";
        if(cipher.hint1trigger){
            $('#cipher'+i+'_hint1_progress').html('100%');
            $('#cipher'+i+'_hint1_progress').css('width', '100%');
        }else{
            $('#cipher'+i+'_hint1_progress').html(hint1progress);
            $('#cipher'+i+'_hint1_progress').css('width', hint1progress);
        }
        var hint2progress = Math.floor((currentHours - publishHours) / 12 * 100) + "%";
        if(cipher.hint2trigger){
            $('#cipher'+i+'_hint2_progress').html('100%');
            $('#cipher'+i+'_hint2_progress').css('width', '100%');
        }else{
            $('#cipher'+i+'_hint2_progress').html(hint2progress);
            $('#cipher'+i+'_hint2_progress').css('width', hint2progress);
        }
        var hint3progress = Math.floor((currentHours - publishHours) / 18 * 100) + "%";
        if(cipher.hint3trigger){
            $('#cipher'+i+'_hint3_progress').html('100%');
            $('#cipher'+i+'_hint3_progress').css('width', '100%');
        }else{
            $('#cipher'+i+'_hint3_progress').html(hint3progress);
            $('#cipher'+i+'_hint3_progress').css('width', hint3progress);
        }
    };

    answer = function (answer,id) {
        if(id == ""){
            dialogDan.setMessage("This cipher is unreachable.").open();
            return;
        }
        if(answer == ""){
            dialogDan.setMessage("Input answer please.").open();
            return;
        }
        $.ajax({
            url:"../cipher/"+id+"/answer.json",
            data:{answer:answer},
            type:"POST",
            success:function (result) {
                if(result.msg == "Wrong"){
                    dialogDan.setMessage(result.msg).open();
                }else{
                    dialogSuc.setMessage(result.msg).open();
                }
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
    answer4 = function() {
        var cipher4_answer = $('#cipher4_answer').val();
        var id = $('#cipher4_id').val();
        answer(cipher4_answer,id);
    }

    getHint = function (id,i,j) {
        //alert(id+","+ i +","+ j);
        $.ajax({
            url:"../cipher/"+id+"/hint.json?hint="+j,
            type:"GET",
            success:function (result) {
                if(result.code == 200){
                    $('#cipher'+ i +'_hint' + j + '_content').html("hint"+ j +":"+ result.data);
                }else {
                    dialogDan.setMessage(result.msg).open();
                }
            }
        });
    };
    getCipher = function (id,i) {
        //alert(id+','+i);
        $.ajax({
            url:"../cipher/"+id+".json",
            type:"GET",
            success:function (result) {
                if (result.code == 200){
                    $('#cipher'+ i + '_title').html(result.data.title);
                    $('#cipher'+ i + '_content').html(result.data.content);
                }else {
                    dialogDan.setMessage(result.msg).open();
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
    var canvas=document.getElementById("canvas");
    canvas.width = document.getElementById("container").width;
    canvas.height = document.getElementById("container").height;
</script>
</body>
</html>
