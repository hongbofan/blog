<%--
  Created by IntelliJ IDEA.
  User: hongbofan
  Date: 2016/10/14
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="layout/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../assert/css/style.css" />
    <link rel="stylesheet" href="../assert/css/editormd.preview.css" />
</head>
<body>
<jsp:include page="layout/nav.jsp"></jsp:include>
<div class="container">
    <div class="page-header">
        <h1 class="demo-headline" id="title">TITLE</h1>
    </div>
    <div class="row">
        <div id="test-editormd-view2" class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
            <textarea></textarea>
        </div>
        <div  class="col-xs-0 col-sm-0 col-md-4 col-lg-4">
            <div class="markdown-body editormd-preview-container" id="custom-toc-container">#custom-toc-container</div>
        </div>
    </div>
    <a class="back-to-top fa fa-arrow-up" href="#top" style="position: fixed;bottom: 100px;right: 50px;">
    </a>
</div>

    <script src="../assert/js/jquery.min.js"></script>
    <script src="../assert/lib/marked.min.js"></script>
    <script src="../assert/lib/prettify.min.js"></script>

    <script src="../assert/lib/raphael.min.js"></script>
    <script src="../assert/lib/underscore.min.js"></script>
    <script src="../assert/lib/sequence-diagram.min.js"></script>
    <script src="../assert/lib/flowchart.min.js"></script>
    <script src="../assert/lib/jquery.flowchart.min.js"></script>
    <script src="../assert/js/editormd.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function (){
            showArticleInfo("${id}");
        });
        showArticleInfo=function(id){
            $.ajax({url:"../article/"+id+".json",method:"GET",success:function(result){
                var testEditormdView2 = editormd.markdownToHTML("test-editormd-view2", {
                    markdown: result.article.content,
                    htmlDecode      : "style,script,iframe",  // you can filter tags decode
                    toc             : true,
                    tocContainer    : "#custom-toc-container",
                    tocm            : true,
                    emoji           : false,
                    taskList        : true,
                    tex             : true,  // 默认不解析
                    flowChart       : true,  // 默认不解析
                    sequenceDiagram : true,  // 默认不解析
                });
                $("#title").text(result.article.title);
            }});
        };
    </script>
</body>
</html>
