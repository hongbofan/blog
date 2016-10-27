<%--
  Created by IntelliJ IDEA.
  User: hongbofan
  Date: 2016/10/9
  Time: 14:02
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
<div class="container">
    <div class="page-header">
        <div class="jumbotron">
            <h1>Navbar example</h1>
            <p>This example is a quick exercise to illustrate how the default, static and fixed to top navbar work. It
                includes the responsive CSS and HTML, so it also adapts to your viewport and device.</p>
            <p>To see the difference between static and fixed top navbars, just scroll.</p>
            <p>
                <a class="btn btn-lg btn-primary" href="../../components/#navbar" role="button">View navbar docs &raquo;</a>
            </p>
        </div>
        <h1 class="demo-headline">Components</h1>
    </div>
    <style type="text/css">
    ul,li{list-style:none;}
    .heartPic{width:749px;height:630px;margin:60px auto 0 auto;}
    .heartPic ul{float:left;width:749px;margin: 1px;}
    .heartPic ul li{float:left;width:100px;height:100px;padding:2px;cursor:pointer;}
    .heartPic ul li .on{z-index:99;}
    .heartPic ul li .on {position:relative;left:-25px;top:-25px;padding:5px 5px 20px 5px;}
    </style>
    <div class="heartPic">
        <ul>
            <li></li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li></li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li></li>
        </ul>
        <ul>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
        </ul>
        <ul>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
        </ul>
        <ul>
            <li></li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li></li>
        </ul>
        <ul>
            <li></li>
            <li></li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li></li>
            <li></li>
        </ul>
        <ul>
            <li></li>
            <li></li>
            <li></li>
            <li>
                <div class="in">
                    <img width="100" height="100" src="../assert/img/1.png" />
                </div>
            </li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
</div>
<jsp:include page="layout/foot.jsp"></jsp:include>
<script>
    $(document).ready(function (){
        $("#nav_article").removeClass("active");
        $("#nav_cipher").removeClass("active");
        $("#nav_home").addClass("active");
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
    })
</script>
</body>
</html>
