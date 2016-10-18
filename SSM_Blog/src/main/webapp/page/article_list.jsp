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

    <link rel="stylesheet" type="text/css" href="../assert/css/normalize.css" />
    <%--<link rel="stylesheet" type="text/css" href="../assert/css/demo.css" />--%>
    <link rel="stylesheet" type="text/css" href="../assert/css/component.css" />
    <link rel="stylesheet" type="text/css" href="../assert/css/application-1a51ca5d.css"/>
</head>
<body>
<jsp:include page="layout/nav.jsp"></jsp:include>
<h1 class="demo-headline">Components</h1>
<section class="block-rows columns-4 ">
    <section class="block-group grid-style">
        <article class="block block-common with-img inset-flag">
            <div class="thumb">
                <div class="features">
                </div>
                <a href="/learning/the-arista-event-monitor"><img src="https://d3tdunqjn7n0wj.cloudfront.net/360x240/operations-log-book-crop-748cb64e103e2a004595de8a452508f1.jpg" alt="Log book" srcset="https://d3tdunqjn7n0wj.cloudfront.net/360x240/operations-log-book-crop-748cb64e103e2a004595de8a452508f1.jpg 360w, https://d3tdunqjn7n0wj.cloudfront.net/720x480/operations-log-book-crop-748cb64e103e2a004595de8a452508f1.jpg 720w, https://d3tdunqjn7n0wj.cloudfront.net/1440x960/operations-log-book-crop-748cb64e103e2a004595de8a452508f1.jpg 1440w" sizes="(min-width: 1390px) 310px, (min-width: 1000px) 25vw, (min-width: 600px) 50vw, 100vw" class=""></a>
            </div>
            <div class="flag t-bkg--before flag--inset bg-operations--before">
                <a href="/topics/operations">Operations</a>
            </div>
            <div class="text-group">
                <h2 class="block-title">
                    <a href="/learning/the-arista-event-monitor">The Arista event monitor</a>
                </h2>
                <p class="dek">How nice would it be to have a specific log that keeps track of all route, MAC, and ARP moves/adds/deletes? Arista has a built-in feature that does that for you automatically.</p>
            </div>
        </article>
        <article class="block block-common with-img inset-flag">
            <div class="thumb">
                <div class="features">
                </div>
                <a href="/learning/the-secrets-behind-great-one-on-one-meetings"><img src="https://d3tdunqjn7n0wj.cloudfront.net/360x240/gettyimages-504446566-c03f42a7263ad4ed16558091df304b3d.jpg" alt="One-on-one." srcset="https://d3tdunqjn7n0wj.cloudfront.net/360x240/gettyimages-504446566-c03f42a7263ad4ed16558091df304b3d.jpg 360w, https://d3tdunqjn7n0wj.cloudfront.net/720x480/gettyimages-504446566-c03f42a7263ad4ed16558091df304b3d.jpg 720w, https://d3tdunqjn7n0wj.cloudfront.net/1440x960/gettyimages-504446566-c03f42a7263ad4ed16558091df304b3d.jpg 1440w" sizes="(min-width: 1390px) 310px, (min-width: 1000px) 25vw, (min-width: 600px) 50vw, 100vw" class=""></a>
            </div>
            <div class="flag t-bkg--before flag--inset bg-business--before">
                <a href="/topics/business">Business</a>
            </div>
            <div class="text-group">
                <h2 class="block-title">
                    <a href="/learning/the-secrets-behind-great-one-on-one-meetings">The Secrets Behind Great One-on-One Meetings</a>
                </h2>
                <p class="dek">Learn best practices for one-on-one meetings that promote productivity and team loyalty within your business</p>
            </div>
        </article>
        <article class="block block-common with-img inset-flag">
            <div class="thumb">
                <div class="features">
                </div>
                <a href="/learning/common-questions-in-data-science-interviews"><img src="https://d3tdunqjn7n0wj.cloudfront.net/360x240/327122302_bbc4a3935b_o_crop-fa62ae02a77608a2d9727eb6f64f4d3f.jpg" alt="Question mark in Esbjerg." srcset="https://d3tdunqjn7n0wj.cloudfront.net/360x240/327122302_bbc4a3935b_o_crop-fa62ae02a77608a2d9727eb6f64f4d3f.jpg 360w, https://d3tdunqjn7n0wj.cloudfront.net/720x480/327122302_bbc4a3935b_o_crop-fa62ae02a77608a2d9727eb6f64f4d3f.jpg 720w, https://d3tdunqjn7n0wj.cloudfront.net/1440x960/327122302_bbc4a3935b_o_crop-fa62ae02a77608a2d9727eb6f64f4d3f.jpg 1440w" sizes="(min-width: 1390px) 310px, (min-width: 1000px) 25vw, (min-width: 600px) 50vw, 100vw" class=""></a>
            </div>
            <div class="flag t-bkg--before flag--inset bg-data--before">
                <a href="/topics/data-culture">Data culture</a>
            </div>
            <div class="text-group">
                <h2 class="block-title">
                    <a href="/learning/common-questions-in-data-science-interviews">Common questions in data science interviews</a>
                </h2>
                <p class="dek">Katie Kent and Jonathan Dinu discuss topics you may be asked about in data science interviews, depending on the types of data science jobs you interview for.</p>
            </div>
        </article>
        <article class="block block-common with-img inset-flag">
            <div class="thumb">
                <div class="features">
                </div>
                <a href="/learning/the-microservices-value-proposition"><img src="https://d3tdunqjn7n0wj.cloudfront.net/360x240/bacteria-108898_1400p-ba329c15a51939a8d9e91e612db52882.jpg" alt="Bacteria" srcset="https://d3tdunqjn7n0wj.cloudfront.net/360x240/bacteria-108898_1400p-ba329c15a51939a8d9e91e612db52882.jpg 360w, https://d3tdunqjn7n0wj.cloudfront.net/720x480/bacteria-108898_1400p-ba329c15a51939a8d9e91e612db52882.jpg 720w, https://d3tdunqjn7n0wj.cloudfront.net/1440x960/bacteria-108898_1400p-ba329c15a51939a8d9e91e612db52882.jpg 1440w" sizes="(min-width: 1390px) 310px, (min-width: 1000px) 25vw, (min-width: 600px) 50vw, 100vw" class=""></a>
            </div>
            <div class="flag t-bkg--before flag--inset bg-software-engineering--before">
                <a href="/topics/software-architecture">Software Architecture</a>
            </div>
            <div class="text-group">
                <h2 class="block-title">
                    <a href="/learning/the-microservices-value-proposition">The microservices value proposition</a>
                </h2>
                <p class="dek">Examine the benefits of microservice architecture and techniques to achieve them.</p>
            </div>
        </article>
        <article class="block block-common with-img inset-flag">
            <div class="thumb">
                <div class="features">
                </div>
                <a href="/learning/easy-reproducible-reports-with-r"><img src="https://d3tdunqjn7n0wj.cloudfront.net/360x240/the_caxton_celebration_-_william_caxton_showing_specimens_of_his_printing_to_king_edward_iv_and_his_queen_crop-c5353eec2f261ece8eeb9f99969eaadf.jpg" alt="William Caxton showing specimens of his printing to King Edward IV and his Queen." srcset="https://d3tdunqjn7n0wj.cloudfront.net/360x240/the_caxton_celebration_-_william_caxton_showing_specimens_of_his_printing_to_king_edward_iv_and_his_queen_crop-c5353eec2f261ece8eeb9f99969eaadf.jpg 360w, https://d3tdunqjn7n0wj.cloudfront.net/720x480/the_caxton_celebration_-_william_caxton_showing_specimens_of_his_printing_to_king_edward_iv_and_his_queen_crop-c5353eec2f261ece8eeb9f99969eaadf.jpg 720w, https://d3tdunqjn7n0wj.cloudfront.net/1440x960/the_caxton_celebration_-_william_caxton_showing_specimens_of_his_printing_to_king_edward_iv_and_his_queen_crop-c5353eec2f261ece8eeb9f99969eaadf.jpg 1440w" sizes="(min-width: 1390px) 310px, (min-width: 1000px) 25vw, (min-width: 600px) 50vw, 100vw" class=""></a>
            </div>
            <div class="flag t-bkg--before flag--inset bg-data--before">
                <a href="/topics/data-tools">Data Tools</a>
            </div>
            <div class="text-group">
                <h2 class="block-title">
                    <a href="/learning/easy-reproducible-reports-with-r">Easy, reproducible reports with R</a>
                </h2>
                <p class="dek">Garrett Grolemund demonstrates how to use R Markdown to combine code and text into a single .Rmd file to generate polished reports automatically in a variety of formats.</p>
            </div>
        </article>
        <article class="block block-common with-img inset-flag">
            <div class="thumb">
                <div class="features">
                </div>
                <a href="/learning/clair-clarity-with-container-security-scanning"><img src="https://d3tdunqjn7n0wj.cloudfront.net/360x240/security-thistle-close-up-crop-e67308d85af452332c80b12377b622c2.jpg" alt="Close-up of thistle" srcset="https://d3tdunqjn7n0wj.cloudfront.net/360x240/security-thistle-close-up-crop-e67308d85af452332c80b12377b622c2.jpg 360w, https://d3tdunqjn7n0wj.cloudfront.net/720x480/security-thistle-close-up-crop-e67308d85af452332c80b12377b622c2.jpg 720w, https://d3tdunqjn7n0wj.cloudfront.net/1440x960/security-thistle-close-up-crop-e67308d85af452332c80b12377b622c2.jpg 1440w" sizes="(min-width: 1390px) 310px, (min-width: 1000px) 25vw, (min-width: 600px) 50vw, 100vw" class=""></a>
            </div>
            <div class="flag t-bkg--before flag--inset bg-software-engineering--before">
                <a href="/topics/open-source">Open Source</a>
            </div>
            <div class="text-group">
                <h2 class="block-title">
                    <a href="/learning/clair-clarity-with-container-security-scanning">Clair: Clarity with container security scanning</a>
                </h2>
                <p class="dek">Learn about Clair, a new open source tool to monitor the security of containers and automatically detect vulnerabilities in Docker and rkt containers.</p>
            </div>
        </article>
        <article class="block block-common with-img inset-flag">
            <div class="thumb">
                <div class="features">
                </div>
                <a href="/learning/the-security-advantage-of-speed-of-delivery"><img src="https://d3tdunqjn7n0wj.cloudfront.net/360x240/security-bike-courier-at-night-crop-977503a9db9509d2076f46fc1d821f70.jpg" alt="Bike courier at night" srcset="https://d3tdunqjn7n0wj.cloudfront.net/360x240/security-bike-courier-at-night-crop-977503a9db9509d2076f46fc1d821f70.jpg 360w, https://d3tdunqjn7n0wj.cloudfront.net/720x480/security-bike-courier-at-night-crop-977503a9db9509d2076f46fc1d821f70.jpg 720w, https://d3tdunqjn7n0wj.cloudfront.net/1440x960/security-bike-courier-at-night-crop-977503a9db9509d2076f46fc1d821f70.jpg 1440w" sizes="(min-width: 1390px) 310px, (min-width: 1000px) 25vw, (min-width: 600px) 50vw, 100vw" class=""></a>
            </div>
            <div class="flag t-bkg--before flag--inset bg-security--before">
                <a href="/topics/security">Security</a>
            </div>
            <div class="text-group">
                <h2 class="block-title">
                    <a href="/learning/the-security-advantage-of-speed-of-delivery">How continuous delivery helps security keep up with change</a>
                </h2>
                <p class="dek">Navigating the accelerating velocity of change in DevOps.</p>
            </div>
        </article>
        <article class="block block-common with-img inset-flag">
            <div class="thumb">
                <div class="features">
                </div>
                <a href="/learning/introduction-to-local-interpretable-model-agnostic-explanations-lime"><img src="https://d3tdunqjn7n0wj.cloudfront.net/360x240/19940716923_b744e1ac03_o_crop-b95997e4386e91c0c3a1aa7855551305.jpg" alt="Happy predictions." srcset="https://d3tdunqjn7n0wj.cloudfront.net/360x240/19940716923_b744e1ac03_o_crop-b95997e4386e91c0c3a1aa7855551305.jpg 360w, https://d3tdunqjn7n0wj.cloudfront.net/720x480/19940716923_b744e1ac03_o_crop-b95997e4386e91c0c3a1aa7855551305.jpg 720w, https://d3tdunqjn7n0wj.cloudfront.net/1440x960/19940716923_b744e1ac03_o_crop-b95997e4386e91c0c3a1aa7855551305.jpg 1440w" sizes="(min-width: 1390px) 310px, (min-width: 1000px) 25vw, (min-width: 600px) 50vw, 100vw" class=""></a>
            </div>
            <div class="flag t-bkg--before flag--inset bg-data--before">
                <a href="/topics/data-science">Data science</a>
            </div>
            <div class="text-group">
                <h2 class="block-title">
                    <a href="/learning/introduction-to-local-interpretable-model-agnostic-explanations-lime">Introduction to Local Interpretable Model-Agnostic Explanations (LIME)</a>
                </h2>
                <p class="dek">A technique to explain the predictions of any machine learning classifier.</p>
            </div>
        </article>
        <article class="block block-common with-img inset-flag">
            <div class="thumb">
                <div class="features">
                </div>
                <a href="/learning/best-practices-for-streaming-applications"><img src="https://d3tdunqjn7n0wj.cloudfront.net/360x240/dancing_house_windows_crop-c835031d2753cfcde7d86dd3435e1389.jpg" alt="Frank Gehry's Dancing House windows." srcset="https://d3tdunqjn7n0wj.cloudfront.net/360x240/dancing_house_windows_crop-c835031d2753cfcde7d86dd3435e1389.jpg 360w, https://d3tdunqjn7n0wj.cloudfront.net/720x480/dancing_house_windows_crop-c835031d2753cfcde7d86dd3435e1389.jpg 720w, https://d3tdunqjn7n0wj.cloudfront.net/1440x960/dancing_house_windows_crop-c835031d2753cfcde7d86dd3435e1389.jpg 1440w" sizes="(min-width: 1390px) 310px, (min-width: 1000px) 25vw, (min-width: 600px) 50vw, 100vw" class=""></a>
            </div>
            <div class="flag t-bkg--before flag--inset bg-data--before">
                <a href="/topics/data-tools">Data Tools</a>
            </div>
            <div class="text-group">
                <h2 class="block-title">
                    <a href="/learning/best-practices-for-streaming-applications">Best practices for streaming applications</a>
                </h2>
                <p class="dek">Mark Grover and Ted Malaska offer an overview of projects for streaming applications, including Kafka, Flume, and Spark Streaming, and discuss the architectural schemas available, such as Lambda and Kappa.</p>
            </div>
        </article>

    </section>
</section>
    <div class="container">
        <a href="/article/editor.htm" class="btn btn-primary">Write</a>
        <div class="row" id="article-list-box">
        </div> <!-- /row -->
        <section id="grid" class="grid clearfix">
        </section>
        <div>
            <ul class="pagination pagination-minimal" id="pagination-box">
            </ul>
        </div>
    </div>
<jsp:include page="layout/foot.jsp"></jsp:include>
<script src="../assert/js/snap.svg-min.js"></script>
<script>
    $(document).ready(function (){
        $("#nav_home").removeClass("active");
        $("#nav_article").addClass("active");
        getArticleListBySearch(1);
    });
    getArticleListBySearch = function (page) {
        $.ajax({
            url: "../article/list.json?p=" + page, type: "GET", success: function (result) {
                var articleListTemplate = _.template($("#article-list-template").html(), {list: result.pageInfo.list});
                $("#article-list-box").html(articleListTemplate);
                var articleListTemplate2 = _.template($("#article-list-template2").html(), {list: result.pageInfo.list});
                $("#grid").html(articleListTemplate2);
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

        [].slice.call ( document.querySelectorAll( '#grid > a' ) ).forEach( function( el ) {
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
<script id="article-list-template2" type="text/template">

    {% for( var article in list){ %}
    <a href="#" data-path-hover="M 0,0 0,38 90,58 180.5,38 180,0 z">
        <figure>
            <img src="../assert/img/1.png" />
            <svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 0 0 L 0 182 L 90 126.5 L 180 182 L 180 0 L 0 0 z "/></svg>
            <figcaption>
                <h2>{%= list[article]['title'] %}</h2>
                <p>Soko radicchio bunya nuts gram dulse.</p>
                <%--<button>View</button>--%>
            </figcaption>
        </figure>
    </a>
    {% } %}
</script>
<script id="article-list-template" type="text/template">
    <div class="col-lg-12">
        <div class="row">
            {% for( var article in list){ %}
            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                <div class="tile">
                    <img src="../../img/icons/svg/loop.svg" alt="Infinity-Loop" class="tile-image">
                    <h3 class="tile-title">{%= list[article]['title'] %}</h3>
                    <p>&nbsp</p>
                    <a class="btn btn-primary btn-large btn-block" href="/article/{%= list[article]['id'] %}.htm">Get
                        Pro</a>
                </div>
            </div>
            {% } %}
        </div> <!-- /row -->
    </div>
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
