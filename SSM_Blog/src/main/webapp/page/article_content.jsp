<%--
  Created by IntelliJ IDEA.
  User: hongbofan
  Date: 2016/10/14
  Time: 10:04
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
        <textarea >${markdown}</textarea>
    </div>
<%--${html}--%>
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
        $(function() {
                    var testEditormdView, testEditormdView2;

//                    $.get("test.md", function (markdown) {
//
//                        testEditormdView = editormd.markdownToHTML("test-editormd-view", {
//                            markdown: markdown,//+ "\r\n" + $("#append-test").text(),
//                            //htmlDecode      : true,       // 开启 HTML 标签解析，为了安全性，默认不开启
//                            htmlDecode: "style,script,iframe",  // you can filter tags decode
//                            //toc             : false,
//                            tocm: true,    // Using [TOCM]
//                            //tocContainer    : "#custom-toc-container", // 自定义 ToC 容器层
//                            //gfm             : false,
//                            //tocDropdown     : true,
//                            // markdownSourceCode : true, // 是否保留 Markdown 源码，即是否删除保存源码的 Textarea 标签
//                            emoji: true,
//                            taskList: true,
//                            tex: true,  // 默认不解析
//                            flowChart: true,  // 默认不解析
//                            sequenceDiagram: true,  // 默认不解析
//                        });
//
//                        //console.log("返回一个 jQuery 实例 =>", testEditormdView);
//
//                        // 获取Markdown源码
//                        //console.log(testEditormdView.getMarkdown());
//
//                        //alert(testEditormdView.getMarkdown());
//                    });
            testEditormdView2 = editormd.markdownToHTML("test-editormd-view2", {
                htmlDecode      : "style,script,iframe",  // you can filter tags decode
                emoji           : true,
                taskList        : true,
                tex             : true,  // 默认不解析
                flowChart       : true,  // 默认不解析
                sequenceDiagram : true,  // 默认不解析
            });
        });
    </script>
</body>
</html>
