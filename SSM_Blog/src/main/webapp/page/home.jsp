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
<h1 class="demo-headline">Components</h1>
<h1 class="demo-headline">Components</h1>
<h1 class="demo-headline">Components</h1>
<h1 class="demo-headline">Components</h1>
<h1 class="demo-headline">Components</h1>
<div class="container">
    <div class="jumbotron">
        <h1>Navbar example</h1>
        <p>This example is a quick exercise to illustrate how the default, static and fixed to top navbar work. It
            includes the responsive CSS and HTML, so it also adapts to your viewport and device.</p>
        <p>To see the difference between static and fixed top navbars, just scroll.</p>
        <p>
            <a class="btn btn-lg btn-primary" href="../../components/#navbar" role="button">View navbar docs &raquo;</a>
        </p>
    </div>

</div>
<jsp:include page="layout/foot.jsp"></jsp:include>
<script>
    $(document).ready(function (){
        $("#nav_article").removeClass("active");
        $("#nav_home").addClass("active");
    });
</script>
</body>
</html>
