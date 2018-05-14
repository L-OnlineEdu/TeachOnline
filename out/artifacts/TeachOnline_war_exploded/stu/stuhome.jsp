<%--
  Created by IntelliJ IDEA.
  User: kwinter
  Date: 2018/4/24
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">


<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>学生首页</title>

    <!-- Favicons-->


    <!-- CORE CSS-->
    <link href="../tea/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="../tea/css/style.css" type="text/css" rel="stylesheet" media="screen,projection">


</head>

<body>



<!-- //////////////////////////////////////////////////////////////////////////// -->

<!-- START HEADER -->
<header id="header" class="page-topbar">
    <!-- start header nav-->
    <div class="navbar-fixed">
        <nav class="cyan">
            <div class="nav-wrapper">
                <h1 class="logo-wrapper"><a href="index.html" class="brand-logo darken-1"><img src="img/materialize-logo.png" alt="materialize logo"></a> <span class="logo-text">Materialize</span></h1>
                <ul class="right hide-on-med-and-down">

                    <li>
                        <a href="javascript:void(0);" class="waves-effect waves-block waves-light">
                            <i class="mdi-maps-local-library" style="margin-top:-7px;margin-bottom:-14px"></i>
                            <label style="display: block; text-align: center; font-size: 10px; line-height: 14px; cursor: pointer; color:#FFF;">我的课堂</label>
                        </a>

                    </li>

                    <li>
                        <a href="javascript:void(0);" class="waves-effect waves-block waves-light">
                            <i class="mdi-social-poll" style="margin-top:-7px;margin-bottom:-14px"></i>
                            <label style="display: block; text-align: center; font-size: 10px; line-height: 14px; cursor: pointer; color:#FFF;">我的题库</label>
                        </a>

                    </li>
                    <li>
                        <div class="row" style="width:150px;margin-bottom:-10px;" >
                            <div class="col col s4 m4 l4" style="padding-top:10px;">
                                <img src="img/teacher.jpg" alt="" class="circle responsive-img valign ">
                            </div>
                            <div class="col col s1 m1 l1" style="margin-left:-20px;">
                                <ul id="profile-dropdown" class="dropdown-content" style="width:20px;">
                                    <li><a href="#"><i class="mdi-action-face-unlock"></i> Profile</a>
                                    </li>
                                    <li><a href="#"><i class="mdi-action-settings"></i> Settings</a>
                                    </li>
                                    <li><a href="#"><i class="mdi-communication-live-help"></i> Help</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li><a href="#"><i class="mdi-action-lock-outline"></i> Lock</a>
                                    </li>
                                    <li><a href="#"><i class="mdi-hardware-keyboard-tab"></i> Logout</a>
                                    </li>
                                </ul>

                                <a class="btn-flat dropdown-button waves-effect waves-light white-text profile-btn" style="width:200px;"  href="#" data-activates="profile-dropdown">
                                    John ▼
                                </a>

                            </div>
                        </div>
                    </li>

                </ul>

            </div>

        </nav>
    </div>
    <!-- end header nav-->
</header>

<div class="wrapper" style="background:#e8e8e8;">

    <!-- 页面内容放在这里 -->
    <div class="info-wapper">
        <div class="h-wapper">
            <img size="40" src="img/teacher.jpg" style="color: rgb(255, 255, 255); background-color: rgb(188, 188, 188); user-select: none; display: inline-flex; align-items: center; justify-content: center; font-size: 20px; border-radius: 100%; height: 75px; width: 75px; position: absolute; left: 50%; bottom: -12px; margin-left: -37.5px; z-index: 1;">

        </div>
        <div class="techer-info-wapper">
            <p class="techer-name">我</p>
            <p class="college">北大 · 无</p>
            <p class="job-title">111</p>
        </div>
        <div class="number-wapper">
            <div class="bottom-border"></div>
            <div class="center-number">
                <div class="wapper">
                    <div class="right-margin">
                        <p class="num">1</p>
                        <p class="dec">课堂</p>
                    </div></div><div class="wapper">
                <div class="right-margin">
                    <p class="num">2</p>
                    <p class="dec">学生</p></div>
            </div><div class="wapper">
                <div class="right-margin">
                    <p class="num">2</p>
                    <p class="dec">题目</p>
                </div>
            </div>
                <div class="wapper">
                    <div class="right-margin">
                        <p class="num">0</p>
                        <p class="dec">组卷</p>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div style="height:200px;">
        <div class="add-private-classroom">
            <div class="add-private-panels">

                <div style="margin: 0px 20px 20px 0px; float: left;">
                <div class="classroom-card">

                    <a class="classroom-card" href="/tea/two.html">
                        <img class="classroom-image" src="img/default-class.png" alt="classroom">
                        <div class="classroom-status">
                            <div class="classroom-title">
                                <div class="" data-tooltipped="" aria-describedby="tippy-tooltip-1" data-original-title="吃饭" style="display: inline;">
                                    <div class="classroom-name">吃饭</div>
                                </div>
                            </div>
                            <div class="classroom-info">
                                <span class="classroom-season"><!-- react-text: 137 -->2018<!-- /react-text --><!-- react-text: 138 -->学年·<!-- /react-text --><!-- react-text: 139 -->春<!-- /react-text --></span><!-- react-text: 140 --><!-- /react-text --></div>
                        </div>
                    </a>
                </div>
                </div>

                <div style="margin: 0px 20px 20px 0px; float: left;">
                    <div class="classroom-card">
                        <a class="classroom-card" href="/tea/two.html">
                            <img class="classroom-image" src="img/default-class.png" alt="classroom">
                            <div class="classroom-status">
                                <div class="classroom-title">
                                    <div class="" data-tooltipped="" aria-describedby="tippy-tooltip-1" data-original-title="吃饭" style="display: inline;">
                                        <div class="classroom-name">吃饭</div>
                                    </div>
                                </div>
                                <div class="classroom-info">
                                    <span class="classroom-season"><!-- react-text: 137 -->2018<!-- /react-text --><!-- react-text: 138 -->学年·<!-- /react-text --><!-- react-text: 139 -->春<!-- /react-text --></span><!-- react-text: 140 --><!-- /react-text --></div>
                            </div>
                        </a>
                    </div>
                </div>

                <div style="margin: 0px 20px 20px 0px; float: left;">
                    <div class="classroom-card">
                        <a class="classroom-card" href="/tea/two.html">
                            <img class="classroom-image" src="img/default-class.png" alt="classroom">
                            <div class="classroom-status">
                                <div class="classroom-title">
                                    <div class="" data-tooltipped="" aria-describedby="tippy-tooltip-1" data-original-title="吃饭" style="display: inline;">
                                        <div class="classroom-name">吃饭</div>
                                    </div>
                                </div>
                                <div class="classroom-info">
                                    <span class="classroom-season"><!-- react-text: 137 -->2018<!-- /react-text --><!-- react-text: 138 -->学年·<!-- /react-text --><!-- react-text: 139 -->春<!-- /react-text --></span><!-- react-text: 140 --><!-- /react-text --></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
</div>

<!-- END HEADER -->

<!-- //////////////////////////////////////////////////////////////////////////// -->

<!-- START MAIN -->

<!-- END MAIN -->



<!-- //////////////////////////////////////////////////////////////////////////// -->

<!-- START FOOTER -->

<!-- END FOOTER -->


<!-- ================================================
Scripts
================================================ -->

<!-- jQuery Library -->
<script src="../tea/js/jquery-1.11.2.min.js"></script>
<!--materialize js-->
<script type="text/javascript" src="../tea/js/materialize.min.js"></script>
<!--scrollbar-->
<script type="text/javascript" src="../tea/js/perfect-scrollbar.min.js"></script>


<!--plugins.js - Some Specific JS codes for Plugin Settings-->
<script type="text/javascript" src="../tea/js/plugins.js"></script>
<!-- Toast Notification -->
<script type="text/javascript">
    // Toast Notification
</script>
<style>
    #profile-dropdown li a{
        color:#444;
    }
    .info-wapper {
        position: relative;
        width: 100%;
        height: 268px;
        background-color: #fff;
        box-shadow: 0 0 2px 0 rgba(0,0,0,.1);
        border-radius: 4px;
    }
    .h-wapper {
        position: relative;
        height: 76px;
        border-bottom: 1px solid #eee;
    }
    .techer-name{
        font-size: 24px;
        color: #4a4a4a;
        line-height: 40px;
        margin-top: 15px;
    }
    .college{
        font-size: 14px;
        color: #4a4a4a;
        line-height: 20px;
    }
    .job-title{
        font-size: 12px;
        color: #9b9b9b;
        line-height: 20px;
    }
    .techer-info-wapper{
        height: 110px;
        text-align: center;
    }
    .number-wapper {
        text-align: center;
        height: 66px;
    }
    .bottom-border {
        height: 28px;
        border-bottom: 1px solid #eee;
        z-index: 0;
    }
    .center-number{
        margin-top: -20px;
        background-color: hsla(0,0%,100%,0);
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        -ms-flex-pack: center;
        justify-content: center;
    }
    .wapper{
        background-color: #fff;
    }
    .right-margin {
        margin: 0 24px;
    }
    .num {
        font-size: 20px;
        color: #4a4a4a;
        text-align: center;
    }
    .right-margin p {
        margin: 0;
    }
    .right-margin .dec {
        font-size: 12px;
        color: #9b9b9b;
        line-height: 20px;
    }
    .listWrapper {
        position: relative;
    }
    .add-private-classroom  {
        padding: 18px 32px;
        background: #e8e8e8;
    }
    .add-private-panels {
        display: table;
    }
    .add-panel {
        background-color: transparent;
        border: 2px dashed #c8c8c8;
        box-shadow: 0 0 2px 0 rgba(0,0,0,.1);
        border-radius: 4px;
        width: 218px;
        height: 258px;
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        -ms-flex-pack: center;
        justify-content: center;
        box-sizing: border-box;
    }
    .classroom-card {
        background: #fff;
        box-shadow: 0px 0px 2px 0px rgba(0, 0, 0, 0.1);
        border-radius: 4px;
        width: 220px;
        height: 200px;
        position: relative;
        text-decoration: none;
        float: left;

    }

    .open-num-warpper {
        position: absolute;
        left: 0;
        right: 0;
        height: 24px;
        background-color: rgba(1, 169, 135, 0.8);
        color: white;
        font-size: 12px;
        padding: 0px 8px;
        border-radius: 4px 4px 0px 0px;
        z-index: 1;
        display: flex;
        align-items: center;
    }

    .close-btn {
        position: absolute;
        right: 8px;
        top: 5px;
        border-bottom: 1px solid #fff;
        cursor: pointer;
    }

    .classroom-image {
        width: 220px;
        height: 160px;
        vertical-align: bottom;
        border-radius: 4px 4px 0 0;
    }

    .attest {
        height: 20px;
        line-height: 20px;
        background-color: #fff;
        color: #00C4B2;
        font-size: 12px;
        padding: 0 10px;
        position: absolute;
        left: 0;
        right: 0;
        top: 0;
        width: 200px;
    }

    .image-style {
        width: 100%;
        height: 100%;
    }

    .classroom-status {
        padding: 5px 10px 5px 10px;
        font-size: 12px;
        color: #fff;
        background: #333;
        width: 220px;
        height: 50px;
    }

    .classroom-number {
        padding: 5px 0 4px 5px;
        float: left;
    }

    .classroom-season {
        float: left;
    }

    .classroom-name {
        height: 20px;
        font-size: 16px;
        color: #fff;
        float: left;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        width: 100%;
    }

    .classroom-info {
        padding-top: 5px;
        width: 100%;
        font-size: 12px;
        color: #d3d3d3;
        text-align: left;
        height: 15px;
    }

    .classroom-number {
        font-size: 12px;
        color: #4a4a4a;
        float: left;
        padding-top: 6px;
    }

    .question-icon {
        float: right;
        width: 10px;
        height: 12px;
        background-image: url("../../images/question.png");
    }

    .classroom-title {
        width: 100%;
        height: 20px;
        position: relative;
    }

    .classroom-team-icon {
        font-size: 14px;
        line-height: 18px;
    }

    .teacher {
        float: right;
    }

    .students {
        padding: 10px 10px 15px 10px;
        height: 25px;
        width: 200px;
        position: relative;
    }


    .student-span {
        font-size: 12px;
        color: #9b9b9b;
        float: right;
        line-height: 25px;
    }

    .student-number {
        background-color: #fff;
        left: 140px;
        width: 25px;
        height: 25px;
        position: absolute;
        line-height: 25px;
        border-radius: 13px;
        box-shadow: 2px 2px 2px #9b9b9b;
        text-align: center;
        font-size: 10px;
        color: #4a4a4a;
    }

    .classroom-team-icon-div {
        border-radius: 2px;
        width: 18px;
        height: 18px;
        margin-right: 5px;
        background-color: #53d4b3;
        float: left;
        text-align: center;
    }

    .hint {
        text-align: left;
        word-wrap: break-word;
        padding: 4px 6px;
        font-size: 12px;
        background-color: #444;
        position: absolute;
        top: -30px;
        left: 0;
        max-width: 150%;
    }

</style>
</body>

</html>

