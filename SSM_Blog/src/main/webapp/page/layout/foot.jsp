<%--
  Created by IntelliJ IDEA.
  User: hongbofan
  Date: 2016/10/12
  Time: 0:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid">
    <hr>
    <p class="text-center">Copyright © 2016 hongbofan's Blog All Rights Reserved.</p>
</div>

<script src="../../assert/js/jquery.min.js"></script>
<script src="../../assert/js/flat-ui.min.js"></script>
<script src="../../assert/js/application.js"></script>
<script src="../../assert/js/underscore-min.js"></script>
<script type="text/javascript">
    _.templateSettings = {
        evaluate : /\{%([\s\S]+?)\%\}/g,
        interpolate : /\{%=([\s\S]+?)\%\}/g,
        escape : /\{%-([\s\S]+?)%\}/g
    };
</script>
<script>
    $(document).ready(function (){
        checkLogin();
    });
</script>