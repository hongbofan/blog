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
            <p>This example is a quick exercise to illustrate how the default, static and fixed to top navbar work. It includes the responsive CSS and HTML, so it also adapts to your viewport and device.</p>
            <p>To see the difference between static and fixed top navbars, just scroll.</p>
            <p>
                <a class="btn btn-lg btn-primary" href="../../components/#navbar" role="button">View navbar docs &raquo;</a>
            </p>
        </div>
        <p class="mtl ptl">The minimal look:</p>
        <div>
            <ul class="pagination pagination-minimal" id="pagination-box">



            </ul>
        </div>
    </div>

    <jsp:include page="layout/foot.jsp"></jsp:include>


<script>
    $(document).ready(function () {
        getArticleListBySearch(1);
    });
    getArticleListBySearch=function(page){
        $.ajax({url:"../article/list.json?p="+page,type:"GET",success:function(result){
//            var teamListTemplate = _.template($("#record-list-template").html());
//            var vars = { datas:result.pageInfo.list,subNames:result.subNames,pagenum:result.pageInfo.pageNum };
//            var html = teamListTemplate(vars);
//            $("#main-info-box").html(html);
            var paginationTemplate=_.template($("#pagination-template").html(),{pageCount:result.pageInfo.pageCount,pagenum:result.pageInfo.pageNum});
            $("#pagination-box").html(paginationTemplate);
        }});
    };

</script>
    <script id="pagination-template" type="text/template">
        <li class="previous"><a href="javascript:void(0);" onclick="getArticleListBySearch({%- pagenum-1 %})" class="fui-arrow-left"></a></li>
        {%for(var i=1; i<= pageCount; i++){ %}
        <li
                {% if (pagenum == i){ %}
                class="active"
                {% } %}
        >
            <a href="javascript:void(0);" onclick="getArticleListBySearch({%- i %})">
                {%- i %}
            </a>
        </li>
        {% } %}
        <li class="pagination-dropdown dropup">
            <a href="#fakelink" class="dropdown-toggle" data-toggle="dropdown">
                <i class="fui-triangle-up"></i>
            </a>
            <ul class="dropdown-menu">
                <li><a href="#fakelink">10–20</a></li>
                <li><a href="#fakelink">20–30</a></li>
                <li><a href="#fakelink">40–50</a></li>
            </ul>
        </li>
        <li class="next"><a href="javascript:void(0);" onclick="getArticleListBySearch({%- pagenum+1 %})" class="fui-arrow-right"></a></li>
    </script>
</body>
</html>
