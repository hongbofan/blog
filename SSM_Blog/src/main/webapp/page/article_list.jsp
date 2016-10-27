<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: hongbofan
  Date: 2016/10/17
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="layout/head.jsp"></jsp:include>

    <%--<link rel="stylesheet" type="text/css" href="../assert/css/normalize.css" />--%>
    <%--<link rel="stylesheet" type="text/css" href="../assert/css/demo.css" />--%>
    <link rel="stylesheet" type="text/css" href="../assert/css/component.css" />
</head>
<body>
<jsp:include page="layout/nav.jsp"></jsp:include>

    <div class="container">
        <div class="page-header">
            <h1 class="demo-headline">ARTICLES</h1>
            <h1> Code <small>Think&Share</small></h1>
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <a href="/article/editor.htm" class=" btn btn-primary btn-lg">
                        <span class="glyphicon glyphicon-pencil"></span>Write
                    </a>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Title Search" id="search-query-3">
                        <span class="input-group-btn">
                    <button type="submit" class="btn"><span class="fui-search"></span></button>
                    </span>
                </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div id="article-list-box" class="grid"></div>
        </div>
        <p></p>
        <nav style="text-align: center">
            <ul class="pagination pagination-minimal center-block" id="pagination-box"></ul>
        </nav>
    </div>
<jsp:include page="layout/foot.jsp"></jsp:include>
<script src="../assert/js/snap.svg-min.js"></script>
<script>
    $(document).ready(function (){
        $("#nav_home").removeClass("active");
        $("#nav_cipher").removeClass("active");
        $("#nav_article").addClass("active");
        getArticleListBySearch(1);
    });
    getArticleListBySearch = function (page) {
        $.ajax({
            url: "../article/list.json?p=" + page, type: "GET", success: function (result) {
                var articleListTemplate = _.template($("#article-list-template").html(), {list: result.pageInfo.list});
                $("#article-list-box").html(articleListTemplate);
                init();
                var paginationTemplate = _.template($("#pagination-template").html(), {
                    pageCount: result.pageInfo.pageCount,
                    pagenum: result.pageInfo.pageNum
                });
                $("#pagination-box").html(paginationTemplate);
            }
        });
    };
    function init() {
        var speed = 300,
                easing = mina.backout;

        [].slice.call ( document.querySelectorAll( '#article-list-box > a' ) ).forEach( function( el ) {
            var s = Snap( el.querySelector( 'svg' ) ), path = s.select( 'path' ),
                    pathConfig = {
                        from : path.attr( 'd' ),
                        to : el.getAttribute( 'data-path-hover' )
                    };

            el.addEventListener( 'mouseenter', function() {
                path.animate( { 'path' : pathConfig.to }, speed, easing );
            } );

            el.addEventListener( 'mouseleave', function() {
                path.animate( { 'path' : pathConfig.from }, speed, easing );
            } );
        } );
    }
</script>
<script id="article-list-template" type="text/template">

    {% for( var article in list){ %}
    <a href="/article/{%= list[article]['id'] %}.htm" data-path-hover="M 0,0 0,38 90,58 180.5,38 180,0 z" class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
        <figure>
            <img src="../assert/img/1.png" />
            <svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 0 0 L 0 182 L 90 126.5 L 180 182 L 180 0 L 0 0 z "/></svg>
            <figcaption>
                <h2>{%= list[article]['title'] %}</h2>
                <p>Soko radicchio bunya nuts gram dulse.</p>
            </figcaption>
        </figure>
    </a>
    {% } %}
</script>
<script id="pagination-template" type="text/template">
    <li class="previous"><a href="javascript:void(0);" onclick="getArticleListBySearch({%- pagenum-1 %})"
                            class="fui-arrow-left"></a></li>

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
            {% if (ThisPage== i){ %}
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
            {% if (ThisPage== i){ %}
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
            {% if (ThisPage== i){ %}
            class="active"
            {% } %}
    >
        <a href="javascript:void(0);" onclick="getArticleListBySearch({%- i %})">
            {%- i %}
        </a>
    </li>
    {% } %}
    {% } %}
    <li class="next"><a href="javascript:void(0);" onclick="getArticleListBySearch({%- pagenum+1 %})"
                        class="fui-arrow-right"></a></li>
</script>

</body>
</html>
