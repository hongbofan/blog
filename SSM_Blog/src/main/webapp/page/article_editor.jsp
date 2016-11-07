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
    <link rel="stylesheet" href="../assert/css/style.css" />
    <link rel="stylesheet" href="../assert/css/editormd.css" />
</head>
<body>
<jsp:include page="layout/nav.jsp"></jsp:include>
<div class="alert alert-danger" role="alert"  id="err_msg" style="margin-top: 60px;visibility: hidden" ></div>
<form>
    <div class="editormd" id="test-editormd">
        <textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc" id="test-editormd-markdown-doc"></textarea>
        <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
        <textarea class="editormd-html-textarea" name="test-editormd-html-code" id="test-editormd-html-code"></textarea>
    </div>
    <div style="width:90%;margin: 10px auto;">
        <a href="javascript:void(0)" class="btn" onclick="submitContent()">submit</a>
    </div>
</form>

    <script src="../assert/js/jquery.min.js"></script>
    <script src="../assert/js/editormd.min.js"></script>

    <script type="text/javascript">
        var testEditor;
        $(document).ready(function (){
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
            //submitContent();
        });
        submitContent = function () {
            var markdown = $("#test-editormd-markdown-doc").val();
            var html = $("#test-editormd-html-code").val();
            $.ajax({
                url:"../article/upload.do",
                method:"POST",
                data:{
                    "test-editormd-markdown-doc" : markdown,
                    "test-editormd-html-code" : html
                },
                success:function(result) {
                    console.log(result);
                    if (result.status == 1) {
                        window.location.href = '/article/list.htm';
                    } else if(result.status == 0){
                        $("#err_msg").css('visibility', '');
                        $("#err_msg").text(result.err_msg);
                    }else{
                        window.location.href = '/user_login.htm';
                    }
                }
            });
        };
    </script>
</body>
</html>
