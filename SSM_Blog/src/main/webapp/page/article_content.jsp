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
        <div class="row">
            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                <h1 class="demo-headline" id="title">TITLE</h1>
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <p>&nbsp;</p>
                <a href="/article/editor.htm?id=${id}" class="btn-primary btn-lg" id="update">
                    Update
                </a>
            </div>
        </div>

    </div>
    <div class="row">
        <div id="test-editormd-view2" class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
            <textarea></textarea>
        </div>
        <div  class="hidden-xs hidden-sm col-md-4 col-lg-4">
            <div class="markdown-body editormd-preview-container" id="custom-toc-container">#custom-toc-container</div>
        </div>
    </div>
    <a class="back-to-top fa fa-arrow-up" href="#top" style="position: fixed;bottom: 100px;right: 50px;">
    </a>
</div>
<jsp:include page="layout/foot.jsp"></jsp:include>
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
            $("#nav_home").removeClass("active");
            $("#nav_cipher").removeClass("active");
            $("#nav_article").addClass("active");
            $("#nav_login").removeClass("active");
            showArticleInfo("${id}");
        });
        showArticleInfo=function(id){
            $.ajax({url:"../article/"+id+".json",method:"GET",success:function(result){
                if (result.code == 200){
                    var testEditormdView2 = editormd.markdownToHTML("test-editormd-view2", {
                        markdown: result.data.content,
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
                    $("#title").text(result.data.title);
                }else {
                    dialogDan.setMessage(result.msg).open();
                }

            }});
        };
    </script>
</body>
</html>
