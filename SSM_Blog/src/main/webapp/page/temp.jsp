<%--
  Created by IntelliJ IDEA.
  User: hongbofan
  Date: 2016/10/19
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>jQuery心型图片墙鼠标悬浮变大</title>
    <style type="text/css">
        *{padding:0; margin:0;}
        ul,li{list-style:none;}
        .heartPic{width:749px;height:630px;margin:60px auto 0 auto;}
        .heartPic ul{float:left;width:749px;}
        .heartPic ul li{float:left;width:100px;height:100px;padding:2px;cursor:pointer;}
        .heartPic ul li.on{z-index:99;}
        .heartPic ul li.on {position:relative;left:-50px;top:-50px;padding:5px 5px 20px 5px;background:#666;}
        .heartPic ul li .pTxt{display:none;width:100px;height:15px;text-align:center;color:#fff;overflow:hidden;}
        .heartPic .showDiv{display:block;}
    </style>
</head>
<body>
<div class="heartPic">
    <ul>
        <li></li>
        <li>
            <div class="in">
                <img width="100" height="100" src="../assert/img/favicon.ico" />
                <p class="pTxt">可爱的女娃娃</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="../assert/img/1.png" />
                <p class="pTxt">呆萌的小熊</p>
            </div>
        </li>
        <li></li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_03.jpg" />
                <p class="pTxt">卡哇伊的小熊</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_04.jpg" />
                <p class="pTxt">女巫骑着扫帚</p>
            </div>
        </li>
        <li></li>
    </ul>
    <ul>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_05.jpg" />
                <p class="pTxt">女娃娃</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_06.jpg" />
                <p class="pTxt">星星可爱</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_07.jpg" />
                <p class="pTxt">呆萌女</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_08.jpg" />
                <p class="pTxt">狗狗</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_09.jpg" />
                <p class="pTxt">绿树</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_10.jpg" />
                <p class="pTxt">粉爱粉爱的</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_11.jpg" />
                <p class="pTxt">蜡笔小新</p>
            </div>
        </li>
    </ul>
    <ul>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_12.jpg" />
                <p class="pTxt">震不碎的心</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_13.jpg" />
                <p class="pTxt">很有意境</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_14.jpg" />
                <p class="pTxt">樱木花道最爱啊</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_15.jpg" />
                <p class="pTxt">俩骷髅</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_16.jpg" />
                <p class="pTxt">萌妹子</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_17.jpg" />
                <p class="pTxt">可爱的小狗</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_18.jpg" />
                <p class="pTxt">夫妇俩白头偕老</p>
            </div>
        </li>
    </ul>
    <ul>
        <li></li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_19.jpg" />
                <p class="pTxt">刷子</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_20.jpg" />
                <p class="pTxt">偶的头像</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_21.jpg" />
                <p class="pTxt">树叶子</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_22.jpg" />
                <p class="pTxt">星星</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_23.jpg" />
                <p class="pTxt">浅色哦</p>
            </div>
        </li>
        <li></li>
    </ul>
    <ul>
        <li></li>
        <li></li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_24.jpg" />
                <p class="pTxt">太阳帅哥</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_25.jpg" />
                <p class="pTxt">大笑脸</p>
            </div>
        </li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_26.jpg" />
                <p class="pTxt">企鹅</p>
            </div>
        </li>
        <li></li>
        <li></li>
    </ul>
    <ul>
        <li></li>
        <li></li>
        <li></li>
        <li>
            <div class="in">
                <img width="100" height="100" src="/jscss/demoimg/201404/index_27.jpg" />
                <p class="pTxt">小兔子</p>
            </div>
        </li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>
<script type="text/javascript" src="../assert/js/jquery.min.js"></script>
<script type="text/javascript">
    $(function(){
        $(".heartPic li").hover(function(){
            $(this).addClass("on");
            $(this).find("img").animate({"width":"200px","height":"200px"});
            $(this).find("div").animate({"width":"200px","height":"200px"});
            $(this).find(".pTxt").animate({"width":"200px","height":"20px"});
            $(this).find("p").addClass("showDiv");
        },function(){
            $(this).animate({height:"100px"},100).removeClass("on");
            $(this).find("img").stop(true,true).animate({"width":"100px","height":"100px"});
            $(this).find("div").stop(true,true).animate({"width":"100px","height":"100px"});
            $(this).find(".pTxt").stop(true,true).animate({"width":"0px","height":"0px"});
        });
    })
</script>
<div style="text-align:center;clear:both">
</div>
</body>
</html>