<%--
  Created by IntelliJ IDEA.
  User: hongbofan
  Date: 2016/10/12
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="layout/head.jsp"></jsp:include>
<%--    <link rel="stylesheet" href="../assert/css/style.css" />--%>
    <link rel="stylesheet" href="../assert/css/editormd.css" />
</head>
<body>
<jsp:include page="layout/nav.jsp"></jsp:include>

<div class="alert alert-danger" role="alert"  id="err_msg" style="margin-top: 60px;visibility: hidden" ></div>
<div class="container" style="margin-bottom: 10px">
    <div class="input-group col-xs-8 col-xs-offset-2 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3" >
        <span class="input-group-addon">Title</span>
        <input id="title" placeholder="Enter your article title" class="form-control">
    </div>
</div>
    <div class="editormd" id="test-editormd">
        <textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc" id="test-editormd-markdown-doc"></textarea>
        <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
        <textarea class="editormd-html-textarea" name="test-editormd-html-code" id="test-editormd-html-code"></textarea>
    </div>
<jsp:include page="layout/foot.jsp"></jsp:include>
    <script src="../assert/js/editormd.min.js"></script>

    <script type="text/javascript">
        var testEditor;
        $(document).ready(function (){
            $("#nav_home").removeClass("active");
            $("#nav_cipher").removeClass("active");
            $("#nav_article").addClass("active");
            $("#nav_login").removeClass("active");
            showArticleInfo("${id}");
            testEditor = editormd("test-editormd", {
                width   : "90%",
                height  : 740,
                path    : "../assert/lib/",
                theme   : "dark",
                previewTheme : "dark",
                editorTheme : "pastel-on-dark",
                imageUpload : true,
                imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL : "/file/uploadFile.do",
                saveHTMLToTextarea : true,
                htmlDecode : "style,script,iframe|on*",
                tocm            : true,
                taskList : true,
                tex : true,                   // 开启科学公式TeX语言支持，默认关闭
                flowChart : true,             // 开启流程图支持，默认关闭
                sequenceDiagram : true,       // 开启时序/序列图支持，默认关闭,
            });
        });
        showArticleInfo=function(id){
            $.ajax({url:"../article/"+id+".json",method:"GET",success:function(result){
                if (result.code == 200){
                    $("#test-editormd-markdown-doc").text(result.data.content);
                    $("#title").val(result.data.title);
                }else {
                    dialogDan.setMessage(result.msg).open();
                }

            }});
        };
    </script>
</body>
</html>
