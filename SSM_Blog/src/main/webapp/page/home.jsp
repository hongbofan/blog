<%--
  Created by IntelliJ IDEA.
  User: hongbofan
  Date: 2016/10/9
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head
    <jsp:include page="layout/head.jsp"></jsp:include>
    <link href="../assert/css/home.css" rel="stylesheet">
</head>
<body>
<jsp:include page="layout/nav.jsp"></jsp:include>
<div class="jumbotron" onclick="change()">
    <h1 id="jb_line1">IF......</h1>
    <h1 id="jb_line2">YOU</h1>
    <h1 id="jb_line3">LIKE</h1>
    <p></p>
    <p id="jb_button">
        <a  id="jb_modal" class="btn btn-lg btn-primary"  data-toggle="modal" data-target=".modal_QRCode" role="button">Contact Me &raquo;</a>
    </p>
</div>

<div class="container">
    <div class="page-header">
        <h1 class="demo-headline">To be continued...</h1>
    </div>
    <%--<style type="text/css">--%>
    <%--ul,li{list-style:none;}--%>
    <%--.heartPic{width:749px;height:630px;margin:60px auto 0 auto;}--%>
    <%--.heartPic ul{float:left;width:749px;margin: 1px;}--%>
    <%--.heartPic ul li{float:left;width:100px;height:100px;padding:2px;cursor:pointer;}--%>
    <%--.heartPic ul li .on{z-index:99;}--%>
    <%--.heartPic ul li .on {position:relative;left:-25px;top:-25px;padding:5px 5px 20px 5px;}--%>
    <%--</style>--%>
    <%--<div class="heartPic">--%>
        <%--<ul>--%>
            <%--<li></li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li></li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li></li>--%>
        <%--</ul>--%>
        <%--<ul>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
        <%--</ul>--%>
        <%--<ul>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
        <%--</ul>--%>
        <%--<ul>--%>
            <%--<li></li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li></li>--%>
        <%--</ul>--%>
        <%--<ul>--%>
            <%--<li></li>--%>
            <%--<li></li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li></li>--%>
            <%--<li></li>--%>
        <%--</ul>--%>
        <%--<ul>--%>
            <%--<li></li>--%>
            <%--<li></li>--%>
            <%--<li></li>--%>
            <%--<li>--%>
                <%--<div class="in">--%>
                    <%--<img width="100" height="100" src="../assert/img/1.png" />--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li></li>--%>
            <%--<li></li>--%>
            <%--<li></li>--%>
        <%--</ul>--%>
    <%--</div>--%>
</div>
<div class="modal fade modal_QRCode" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4> WeChat QRCode </h4>
            </div>
            <div class="modal-body">
                <img src="../assert/img/QRCode.jpg" class="img-responsive"/>
            </div>
            <div class="modal-footer">
                <div>You'd better use WeChat browser</div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="layout/foot.jsp"></jsp:include>
<script>
    var lines = new Array("IF......,YOU,LIKE","&nbsp,&nbsp,&nbsp");
    var index = 0;
    $(document).ready(function (){
        $("#nav_article").removeClass("active");
        $("#nav_cipher").removeClass("active");
        $("#nav_home").addClass("active");
        $("#nav_login").removeClass("active");
        change();
        $('#jb_modal').click(function () {
            $('.modal_QRCode').modal('show');
            return false;
        })
    });
</script>
<script type="text/javascript">
    $(function(){
        $(".heartPic li .in").hover(function(){
            $(this).addClass("on");
            $(this).find("img").animate({"width":"200px","height":"200px"});
        },function(){
            $(this).animate({height:"100px"},100).removeClass("on");
            $(this).find("img").stop(true,true).animate({"width":"100px","height":"100px"});
        });
    });
    change = function () {
        var jb_lines = lines[index++].split(',');
        if(index == lines.length){
            $('#jb_button').hide();
        }else{
            $('#jb_button').show();
        }
        for(var i=1;i<=jb_lines.length;i++){
            $('#jb_line'+i).html(jb_lines[i-1]);
        }
        index %= lines.length;
    }
</script>
</body>
</html>
