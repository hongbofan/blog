<%--
  Created by IntelliJ IDEA.
  User: hongbofan
  Date: 2016/10/11
  Time: 23:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Static navbar -->
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
            </button>
            <a class="navbar-brand" href="#">: )</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active" id="nav_home"><a href="/home.htm">Home</a></li>
                <li id="nav_article"><a href="/article/list.htm" >Article</a></li>
                <li id="nav_cipher"><a href="/cipher/index.htm" >Cipher</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li id="nav_login"><a href="/user_login.htm" id="nav-login-link">Login</a></li>
                <li class="dropdown">
                    <a href="javascript:void(0);" id="nav-user-info" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="javascript:void(0);" onclick="UserLoginOut()">Log out</a></li>
                    </ul>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
<script>
    UserLoginOut=function(){
        $.ajax({
            url : "../logout.do",
            method : "get",
            success : function(result){
                if (result.code == 200){
                    window.location.reload();
                }else {
                    alert(result.msg);
                }

            }
        });
    };
    checkLogin=function(){
        $.ajax({
            url : "../check.do",
            method : "get",
            success : function(result){
                if(result.code == 200){
                    //用户已经登录的情况
                    $("#nav-login-link").remove();
                    $("#nav-user-info").html(result.data.name);
//                    $("#person-center-link").attr("href","../users/"+data.userId+".htm");
//                    userId = data.userId;
                }else{
                    //用户没有登录的时候
                    $("#nav-user-info").remove();
//                    alert(result.msg);
                }
            }
        });
    };
</script>