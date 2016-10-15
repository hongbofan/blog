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
        <div class="row" id="article-list-box">

        </div> <!-- /row -->
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
            var articleListTemplate = _.template($("#article-list-template").html(),{list:result.pageInfo.list});
            $("#article-list-box").html(articleListTemplate);
            var paginationTemplate=_.template($("#pagination-template").html(),{pageCount:result.pageInfo.pageCount,pagenum:result.pageInfo.pageNum});
            $("#pagination-box").html(paginationTemplate);
        }});
    };

</script>
    <script id="article-list-template" type="text/template">
        <div class="col-lg-12">
            <div class="row">
                {% for( var article in list){  %}
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                        <div class="tile">
                            <img src="../../img/icons/svg/loop.svg" alt="Infinity-Loop" class="tile-image">
                            <h3 class="tile-title">{%= list[article]['title'] %}</h3>
                            <p>&nbsp</p>
                            <a class="btn btn-primary btn-large btn-block" href="/article/{%= list[article]['id'] %}.htm">Get Pro</a>
                        </div>
                    </div>
                {% } %}
            </div> <!-- /row -->
        </div>
    </script>
    <script id="pagination-template" type="text/template">
        <li class="previous"><a href="javascript:void(0);" onclick="getArticleListBySearch({%- pagenum-1 %})" class="fui-arrow-left"></a></li>

        {%
        var ThisPage = pagenum;
        var pageFor = 6;
        var pageSlipt = pageFor / 2;
        var pageNumber = pageCount;
        //如果页码大于规定的显示页码数则进行操作否则按基本的页码显示
        if (pageNumber > pageFor) {
            if (ThisPage > pageSlipt) {
                if (ThisPage > (pageNumber - pageSlipt)) {
                        countPage = pageNumber + 1;
                }else{
                    countPage = ((ThisPage - pageSlipt) + pageFor);
                }
        %}
                {%for(var i=countPage - pageFor;i< countPage; i++){ %}
                    <li
                            {% if (ThisPage == i){ %}
                            class="active"
                            {% } %}
                    >
                        <a href="javascript:void(0);" onclick="getArticleListBySearch({%- i %})">
                            {%- i %}
                        </a>
                    </li>
                {% } %}
        {%  }else{ %}
                {%for(var i=1; i<= pageFor; i++){ %}
                <li
                        {% if (ThisPage == i){ %}
                        class="active"
                        {% } %}
                >
                    <a href="javascript:void(0);" onclick="getArticleListBySearch({%- i %})">
                        {%- i %}
                    </a>
                </li>
                {% } %}
            {% } %}
        {% }else{ %}
            {%for(var i=1; i<= pageCount; i++){ %}
            <li
                    {% if (ThisPage == i){ %}
                    class="active"
                    {% } %}
            >
                <a href="javascript:void(0);" onclick="getArticleListBySearch({%- i %})">
                    {%- i %}
                </a>
            </li>
            {% } %}
        {% } %}
        <li class="next"><a href="javascript:void(0);" onclick="getArticleListBySearch({%- pagenum+1 %})" class="fui-arrow-right"></a></li>
    </script>
</body>
</html>
