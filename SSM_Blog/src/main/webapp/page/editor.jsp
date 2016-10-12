<%--
  Created by IntelliJ IDEA.
  User: hongbofan
  Date: 2016/10/12
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../assert/css/style.css" />
    <link rel="stylesheet" href="../assert/css/editormd.css" />
</head>
<body>
<form method="post" action="http://editormd.ipandao.com/php/post.php">
    <div class="editormd" id="test-editormd">
        <textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc">[TOC]
#### Disabled options

- TeX (Based on KaTeX);
- Emoji;
- Task lists;
- HTML tags decode;
- Flowchart and Sequence Diagram;

#### Editor.md directory

    editor.md/
            lib/
            css/
            scss/
            tests/
            fonts/
            images/
            plugins/
            examples/
            languages/
            editormd.js
            ...

```html
&lt;!-- English --&gt;
&lt;script src="../dist/js/languages/en.js"&gt;&lt;/script&gt;

&lt;!-- 繁體中文 --&gt;
&lt;script src="../dist/js/languages/zh-tw.js"&gt;&lt;/script&gt;
```
        </textarea>
        <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
        <textarea class="editormd-html-textarea" name="text"></textarea>
    </div>
</form>
    <div style="width:90%;margin: 10px auto;">
        <input type="submit" name="submit" value="提交表单 Submit" style="padding: 5px;" />
    </div>
    <script src="../assert/js/jquery.min.js"></script>
    <script src="../assert/js/editormd.min.js"></script>
    <script type="text/javascript">

        $(function() {
            $.get("./article/upload",function () {
                var testEditor = editormd("test-editormd", {
                    width   : "90%",
                    height  : 640,
                    syncScrolling : "single",
                    path    : "../assert/lib/",
                    theme   : "dark",
                    previewTheme : "dark",
                    editorTheme : "pastel-on-dark",
                    imageUpload : true,
                    imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                    imageUploadURL : "/file/uploadFile.do",
                    saveHTMLToTextarea : true
                });
           });
            //alert(testEditor.getHTML());
            //alert(testEditor.getMarkdown());
            //alert(testEditor.getPreviewedHTML());
        });

    </script>
</body>
</html>
