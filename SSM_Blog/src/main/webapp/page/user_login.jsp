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
</head>
<body>
<div class="container">
    <form action="javascript:void(0);" method="post" name="login">
        <div class="login-form">
            <div class="form-group">
                <input name="login_name" type="text" class="form-control login-field" value="" placeholder="Username" id="login-name" />
                <label class="login-field-icon fui-user" for="login-name"></label>
            </div>

            <div class="form-group">
                <input  name="login_password" type="password" class="form-control login-field" value="" placeholder="Password" id="login-pass" />
                <label class="login-field-icon fui-lock" for="login-pass"></label>
            </div>
            <button class="btn btn-primary btn-lg btn-block" onclick="UserLogin()">Log in</button>
        </div>
    </form>
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
                    window.location.href = "/home.htm";
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
