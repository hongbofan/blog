<%--
  Created by IntelliJ IDEA.
  User: hongbofan
  Date: 2016/10/20
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="layout/head.jsp"></jsp:include>
    <link href="../assert/css/login.css" rel="stylesheet">
</head>
<body>
<jsp:include page="layout/nav.jsp"></jsp:include>
<div class="container">
    <div class="login-page">
        <div class="logo"><img src="../assert/img/img_logo-25ff4bee2e56411470b83c636a7a0dad.png" alt="Img logo"></div>
        <h4 class="title">
            <span><a>Sign in</a><b>·</b><a>Sign up</a></span>
        </h4>
        <div class="sign-in">
            <div class="row">
                <div class="col-xs-1 col-sm-3 col-md-3 col-lg-4"></div>
                <form class="login-form col-xs-10 col-sm-6 col-md-6 col-lg-4">
                    <div class="form-group">
                        <input  type="text" class="form-control login-field " value="" placeholder="Enter your name" id="login-name">
                        <label class="login-field-icon fui-user" for="login-name"></label>
                    </div>
                    <div class="form-group">
                        <input  type="password" class="form-control login-field" value="" placeholder="Password" id="login-pass">
                        <label class="login-field-icon fui-lock" for="login-pass"></label>
                    </div>
                    <a class="btn btn-primary btn-lg btn-block" onclick="UserLogin()">Log in</a>
                    <a class="login-link" href="#">Lost your password?</a>
                </form>
                <div class="col-xs-1 col-sm-3 col-md-3 col-lg-4"></div>
            </div>
        </div>
        <div class="login-sns">
            <p>Other ways...</p>
            <div class="row">
                <div class="col-xs-1 col-sm-1 col-md-4 col-lg-4"></div>
                <ul class="col-xs-10 col-sm-10 col-md-4 col-lg-4">
                    <li class="weibo">
                        <a href="#"><i class="fa fa-qq"></i></a>
                    </li>
                    <li class="qq">
                        <a href="#"><i class="fa fa-weibo"></i></a>
                    </li>
                    <li class="douban">
                        <a href="#"><i class="fa fa-git"></i></a>
                    </li>
                    <li class="google">
                        <a href="#"><i class="fa fa-twitter"></i></a>
                    </li>
                    <li class="wechat">
                        <a href="#"><i class="fa fa-wechat"></i></a>
                    </li>
                </ul>
                <div class="col-xs-1 col-sm-1 col-md-4 col-lg-4"></div>
            </div>
        </div>
    </div>
</div>
    <jsp:include page="layout/foot.jsp"></jsp:include>
<script>
    $(document).ready(function () {
        $("#nav_home").removeClass("active");
        $("#nav_login").addClass("active");
        $("#nav_cipher").removeClass("active");
        $("#nav_article").removeClass("active");
    });
    UserLogin=function(){
        $.ajax({
            url : "../login.do",
            method : "post",
            data : {
                username : $("#login-name").val(),
                password : $("#login-pass").val()
            },
            success : function(data){
                if(data.result == true){
                    window.location.href = "/home.htm";
                }else{
                    alert(data.message);
                    //用户没有登录的时候
                    //$("#nav-user-info").remove();
                }
            }
        });
    };
</script>
</body>
</html>
