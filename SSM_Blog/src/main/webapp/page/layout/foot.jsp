<%--
  Created by IntelliJ IDEA.
  User: hongbofan
  Date: 2016/10/12
  Time: 0:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="footer">
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="navbar-inverse"></div>
            <hr>
            <p class="text-center"><a href="http://www.miitbeian.gov.cn/" target="_blank">浙ICP备17015438号</a></p>
            <p class="text-center">浙江省杭州市余杭区五常街道</p>
            <p class="text-center">Copyright © 2016 hongbofan's Blog All Rights Reserved.</p>
        </div>
    </div>
</footer>


<script src="../../assert/js/jquery.min.js"></script>
<script src="../../assert/js/flat-ui.min.js"></script>
<script src="../../assert/js/application.js"></script>
<script src="../../assert/js/underscore-min.js"></script>
<script src="//cdn.bootcss.com/bootstrap3-dialog/1.35.3/js/bootstrap-dialog.min.js"></script>
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
        dialogSuc =  new BootstrapDialog({
            type: BootstrapDialog.TYPE_SUCCESS,
            title: 'Result',
            cssClass: 'col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 text-center'
        });
        dialogDan = new BootstrapDialog({
            type: BootstrapDialog.TYPE_DANGER,
            title: 'Result',
            cssClass: 'col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 text-center'
        });
    });
</script>