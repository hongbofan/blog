<%--
  Created by IntelliJ IDEA.
  User: hongbofan
  Date: 2016/10/15
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../assert/css/style.css" />
    <link rel="stylesheet" href="../assert/css/editormd.preview.css" />
</head>
<body>
<div id="test-editormd-view2">
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
                emoji           : true,
                taskList        : true,
                tex             : true,  // 默认不解析
                flowChart       : true,  // 默认不解析
                sequenceDiagram : true,  // 默认不解析
            });
        }});
    };
</script>
</body>
</html>
