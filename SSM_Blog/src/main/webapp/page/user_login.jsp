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
    <title>Title</title>
    <jsp:include page="layout/head.jsp"></jsp:include>
    <%--<link href="../assert/css/base-00828532d00225531ad20ff45bf311ea.css" rel="stylesheet">--%>
    <%--<link href="../assert/css/reading-8988004fd0156ba254ff10aac6b854b6.css" rel="stylesheet">--%>
    <link href="../assert/css/login.css" rel="stylesheet">
</head>
<body>
<jsp:include page="layout/nav.jsp"></jsp:include>
<div class="container">
    <div class="login-page">
        <div class="logo"><img src="../assert/img/img_logo-25ff4bee2e56411470b83c636a7a0dad.png" alt="Img logo"></div>
        <h4 class="title">
            <span><a>登陆</a><b>·</b><a>注册</a></span>
        </h4>
        <div class="sign-in">
            <div class="row">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
                <form class="login-form col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <div class="form-group">
                        <input type="text" class="form-control login-field " value="" placeholder="Enter your name" id="login-name">
                        <label class="login-field-icon fui-user" for="login-name"></label>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control login-field" value="" placeholder="Password" id="login-pass">
                        <label class="login-field-icon fui-lock" for="login-pass"></label>
                    </div>
                    <a class="btn btn-primary btn-lg btn-block" href="#">Log in</a>
                    <a class="login-link" href="#">Lost your password?</a>
                </form>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
            </div>
        </div>
        <div class="login-sns">
            <p>您还可以通过以下方式直接登录</p>
            <ul class="login-sns">
                <li class="weibo">
                    <a href="/users/auth/weibo"><i class="fui-search"></i></a>
                </li>
                <li class="qq">
                    <a href="/users/auth/qq_connect"><i class="fui-search"></i></a>
                </li>
                <li class="douban">
                    <a href="/users/auth/douban"><i class="fui-search"></i></a>
                </li>
                <li class="google">
                    <a href="/users/auth/google_oauth2"><i class="fui-search"></i></a>
                </li>
                <li class="wechat">
                    <a href="/users/auth/wechat"><i class="fui-search"></i></a>
                </li>
            </ul>
        </div>
    </div>
</div>
    <jsp:include page="layout/foot.jsp"></jsp:include>
<script>
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
                    window.location.h    = "/home.htm";
                }else{
                    alert("账号或密码错误!")
                    //用户没有登录的时候
                    //$("#nav-user-info").remove();
                }
            }
        });
    };
</script>
</body>
</html>
