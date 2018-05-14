<%--
  Created by IntelliJ IDEA.
  User: kwinter
  Date: 2018/5/7
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">


<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="msapplication-tap-highlight" content="no">
    <meta name="description" content="Materialize is a Material Design Admin Template,It's modern, responsive and based on Material Design by Google. ">
    <meta name="keywords" content="materialize, admin template, dashboard template, flat admin template, responsive admin template,">
    <title>Materialize - Material Design Admin Template</title>




    <!-- CORE CSS-->
    <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection">


</head>

<body>



<!-- //////////////////////////////////////////////////////////////////////////// -->

<!-- START HEADER -->
<header id="header" class="page-topbar">
    <!-- start header nav-->
    <div class="navbar-fixed">
        <nav class="cyan">
            <div class="nav-wrapper">
                <h1 class="logo-wrapper">
                    <a href="index.html" class="brand-logo darken-1">
                        <img src="img/materialize-logo.png" alt="materialize logo">
                    </a>
                    <span class="logo-text">Materialize</span>
                </h1>
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
                        <div class="row" style="width:150px;margin-bottom:-10px;">
                            <div class="col col s4 m4 l4" style="padding-top:10px;">
                                <img src="img/avatar.jpg" alt="" class="circle responsive-img valign ">
                            </div>
                            <div class="col col s1 m1 l1" style="margin-left:-20px;">
                                <ul id="profile-dropdown" class="dropdown-content" style="width:20px;">
                                    <li>
                                        <a href="#">
                                            <i class="mdi-action-face-unlock"></i> Profile</a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="mdi-action-settings"></i> Settings</a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="mdi-communication-live-help"></i> Help</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="#">
                                            <i class="mdi-action-lock-outline"></i> Lock</a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="mdi-hardware-keyboard-tab"></i> Logout</a>
                                    </li>
                                </ul>

                                <a class="btn-flat dropdown-button waves-effect waves-light white-text profile-btn" style="width:200px;" href="#" data-activates="profile-dropdown">
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
<div class="content-wrap">
    <div class="content black_background">



        <div class="right-area">
            <div class="right-area-scroll ">

                <div class="question-wrap card">
                    <div class="question-content">
                        <span class="open-state teal btn-arc">开启中</span>
                        <div class="question-cont">
                            <span class="question-type tip-badge  green-badge white-text">试卷一正在推送</span>
                            <p class="test_time">
                                <b class="alt-1">${examtime}</b>
                            </p>
                        </div>
                        <div class="buttons btns-close ">
                            <a class="edit teal-text btn-edit btn-edit-question">编辑</a>
                            <a class="edit teal-text btn-edit btn-copy-question">克隆</a>
                            <a class="edit teal-text btn-edit btn-del-question">删除</a>
                            <div class="pull-right">

                                <div class="inline-block teal-text time-limit mr-20">
                                    <input type="checkbox" class="filled-in" id="filled-in-box" checked="checked">
                                    <label for="filled-in-box" class="btn-time-limit"></label>
                                    <span class="inline-block time-limit-info">限时</span>
                                </div>
                                <a class="btn-open waves-effect waves-light btn teal">重新开启题目</a>
                            </div>
                        </div>
                           </div>
                    <div class="answer-content">
                        答案：C
                    </div>
                    <div class="card white answer-info mt-20">
                        <div class="right-list">
                            <h3 class="right-list-title">答题概况</h3>

                            <div class="inline-block switch pull-right">
                                <label class="teal-text switch-answer-wrapper font-14">
                                    <input type="checkbox" class="switch-answer" checked="">
                                    <span class="lever"></span>公布答案
                                </label>
                            </div>

                            <div class="inline-block switch pull-right">
                                <label>
                                    <input type="checkbox" class="switch-group" name="group">
                                    <span class="lever"></span>
                                    按分组显示
                                </label>
                            </div>
                            <div class="clearfix"></div>
                            <div class="green-line"></div>
                            <div class="group-chart-container">
                                <div style="position:relative;">
                                    <canvas id="canvas_1" width="150" height="390" style="width: 100px; height: 260px;"></canvas>
                                    <div class="g2-tooltip" style="position: absolute; visibility: hidden; white-space: nowrap; z-index: 999; transition: visibility 0.2s cubic-bezier(0.23, 1, 0.32, 1), left 0.4s cubic-bezier(0.23, 1, 0.32, 1), top 0.4s cubic-bezier(0.23, 1, 0.32, 1); background-color: rgba(0, 0, 0, 0.65); border-radius: 4px; color: rgb(255, 255, 255); font-size: 12px; font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Helvetica, PingFang SC, Hiragino Sans GB, Microsoft YaHei, SimSun, sans-serif; line-height: 20px; padding: 10px 10px 6px;">
                                        <div class="g2-tooltip-title"></div>
                                        <ul class="g2-tooltip-list"></ul>
                                    </div>
                                </div>
                            </div>
                            <div class="right-list-content">
                                <h3 class="right-list-title">
                                    正确人员名单 （
                                    <span class="right-count">0</span>/
                                    <span class="answer-count">2</span>）
                                </h3>
                                <div class="green-line"></div>
                                <ul class="top-list">
                                </ul>
                                <div class="rest-list">
                                </div>
                            </div>
                        </div>



                    </div>
                    <div class="clock-container hidden">
                        <div class="wave4 wave"></div>
                        <div class="wave3 wave"></div>
                        <div class="wave2 wave"></div>
                        <div class="wave1 wave"></div>
                        <div class="bubble"></div>
                        <div id="counter">
                            <div id="counter_item1" class="counter_item">
                                <div class="digit digit0">0</div>
                            </div>
                            <div id="counter_item2" class="counter_item">
                                <div class="digit digit0">0</div>
                            </div>
                            <div id="counter_item3" class="counter_item">
                                <div class="digit digit_colon">:</div>
                            </div>
                            <div id="counter_item4" class="counter_item">
                                <div class="digit digit0">0</div>
                            </div>
                            <div id="counter_item5" class="counter_item">
                                <div class="digit digit0">0</div>
                            </div>
                        </div>
                        <button class="btn teal lighten-3 btn-fold">
                            <i class="icon icon-triangle-up"></i>
                            <span class="tip z-depth-3">点击收起倒计时工具</span>
                        </button>
                    </div>
                </div>
                <div id="finish-tip"></div>
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

    <style>
        li {
            box-sizing: border-box
        }

        .inline-middle,
        img {
            vertical-align: middle
        }

        .btn,
        .btn-arc,
        a {
            text-decoration: none;
            cursor: pointer
        }

        #column:after,
        #scores:after,
        .content .edit-dialog .edit-area .edit-wrap .right-area:after,
        .content .edit-dialog .right-area:after,
        .content .right-area:after,
        .content:after,
        .edit-dialog #column:after,
        .edit-dialog #scores:after,
        .edit-dialog .content .right-area:after,
        .edit-dialog .content:after,
        .edit-dialog .edit-area .edit-wrap #column:after,
        .edit-dialog .edit-area .edit-wrap #scores:after,
        .edit-dialog .edit-area .edit-wrap .clearfix,
        .edit-dialog .edit-area .edit-wrap .content .right-area:after,
        .edit-dialog .edit-area .edit-wrap .content:after,
        .edit-dialog .edit-area .edit-wrap .paper-data .paper-head .buttons:after,
        .edit-dialog .edit-area .edit-wrap .question-tabs:after,
        .edit-dialog .edit-area .edit-wrap .question-wrap .answer-cont:after,
        .edit-dialog .edit-area .edit-wrap .question-wrap .buttons:after,
        .edit-dialog .paper-data .paper-head .buttons:after,
        .edit-dialog .question-tabs:after,
        .edit-dialog .question-wrap .answer-cont:after,
        .edit-dialog .question-wrap .buttons:after,
        .paper-data .paper-head .buttons:after,
        .paper-data .paper-head .edit-dialog .buttons:after,
        .paper-data .paper-head .edit-dialog .edit-area .edit-wrap .buttons:after,
        .question-tabs:after,
        .question-wrap .answer-cont:after,
        .question-wrap .buttons:after,
        .question-wrap .edit-dialog .answer-cont:after,
        .question-wrap .edit-dialog .buttons:after,
        .question-wrap .edit-dialog .edit-area .edit-wrap .answer-cont:after,
        .question-wrap .edit-dialog .edit-area .edit-wrap .buttons:after,
        .subject-data .question-wrap .buttons:after {
            clear: both
        }

        *,
        .edit-dialog .jcrop-tracker {
            -webkit-tap-highlight-color: transparent
        }

        .bold,
        .paper-data .paper-head .count-time .detail-time,
        .paper-data .paper-head .count-time .seconds,
        .paper-dialog .bold,
        .question-wrap .count-time .detail-time,
        .question-wrap .count-time .seconds {
            font-weight: 700
        }

        #chart,
        #column,
        #figure,
        #lines,
        #scores,
        .edit-dialog .edit-area .edit-wrap,
        .question-tabs,
        li {
            list-style: none
        }

        body,
        html {
            height: 100%;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale
        }

        body,
        h1,
        h2,
        h3,
        h4,
        input,
        li,
        ol,
        p,
        ul {
            padding: 0;
            margin: 0
        }

        textarea {
            resize: none;
            box-sizing: content-box
        }

        input:focus,
        textarea:focus {
            outline: 0
        }

        textarea::-webkit-input-placeholder {
            color: #CBCBCB
        }

        textarea::-moz-input-placeholder {
            color: #CBCBCB
        }

        input::-webkit-input-placeholder {
            color: #CBCBCB
        }

        input::-moz-input-placeholder {
            color: #CBCBCB
        }

        label {
            cursor: pointer
        }

        p,
        span {
            word-wrap: break-word
        }

        .position-center {
            position: absolute;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            margin: auto
        }

        article,
        aside,
        dialog,
        figure,
        footer,
        header,
        menu,
        nav,
        section {
            display: block
        }

        button,
        input[type=submit],
        input[type=reset],
        input[type=button] {
            -webkit-appearance: none
        }

        a.link {
            color: #5bc0de
        }



        .light-gray {
            color: #999
        }

        .deep-gray {
            color: #666
        }

        .light-black {
            color: #333
        }

        .deep-black {
            color: #000
        }

        .deep-white {
            color: #a8a8a8
        }

        .btn-blackish-green,
        .btn-green,
        .btn-orange,
        .btn-yellow,
        .white {
            color: #fff
        }

        .info {
            color: #5bc0de
        }

        .green {
            color: #48D1AE
        }

        .deep-green {
            color: #16b48c
        }

        .dark-green {
            color: #0c5442
        }

        .red {
            color: #e45757
        }

        .progress-red {
            color: #df5842
        }

        .orange,
        .yellow {
            color: #F5A623
        }

        .blue {
            color: #2f80b1
        }

        .purple {
            color: #617bbf
        }

        .blank {
            color: #e6e6e6
        }

        .width-100 {
            width: 100px
        }

        .width-154 {
            width: 154px
        }

        .width-250 {
            width: 250px
        }

        .width-290 {
            width: 290px
        }

        .mt-10 {
            margin-top: 10px
        }

        .mt-15 {
            margin-top: 15px
        }

        .mt-20 {
            margin-top: 20px
        }

        .mb-15 {
            margin-bottom: 15px
        }

        .mb-20 {
            margin-bottom: 20px
        }

        .ml-8 {
            margin-left: 8px
        }

        .ml-10 {
            margin-left: 10px
        }

        .ml-20 {
            margin-left: 20px
        }

        .ml-22 {
            margin-left: 22px
        }

        .ml-24 {
            margin-left: 24px
        }

        .ml-30 {
            margin-left: 30px
        }

        .ml-40 {
            margin-left: 40px
        }

        .ml-45 {
            margin-left: 45px
        }

        .ml-60 {
            margin-left: 60px
        }

        .mr-5 {
            margin-right: 5px
        }

        .mr-8 {
            margin-right: 8px
        }

        .mr-10 {
            margin-right: 10px
        }

        .mr-20 {
            margin-right: 20px
        }

        .pl-20 {
            padding-left: 20px
        }

        .h5-pl-10 {
            padding-left: .5rem
        }

        .h5-pl-15 {
            padding-left: .75rem
        }

        .h5-pr-20 {
            padding-right: 1rem
        }

        .h5-pb-20 {
            padding-bottom: 1rem
        }

        .h5-mt-30 {
            margin-top: 1.5rem
        }

        .h5-mr-3 {
            margin-right: .15rem
        }

        .h5-mr-5 {
            margin-right: .25rem
        }

        .h5-mr-10 {
            margin-right: .5rem
        }

        .h5-mr-20 {
            margin-right: 1rem
        }

        .h5-ml-5 {
            margin-left: .25rem
        }

        .h5-ml-10 {
            margin-left: .5rem
        }

        .h5-ml-15 {
            margin-left: .75rem
        }

        .h5-ml-20 {
            margin-left: 1rem
        }

        .h5-ml-30 {
            margin-left: 1.5rem
        }

        .h5-mb-5 {
            margin-bottom: .25rem
        }

        .h5-mb-10 {
            margin-bottom: .5rem
        }

        .h5-mb-15 {
            margin-bottom: .75rem
        }

        .h5-mb-18 {
            margin-bottom: .9rem
        }

        .h5-mb-20 {
            margin-bottom: 1rem
        }

        .h5-mb-25 {
            margin-bottom: 1.25rem
        }

        .h5-mb-30 {
            margin-bottom: 1.5rem
        }

        .h5-mb-45 {
            margin-bottom: 2.25rem
        }

        .h5-mb-80 {
            margin-bottom: 4rem
        }

        .h5-mb-180 {
            margin-bottom: 9rem
        }

        .inline-block,
        .inline-middle {
            display: inline-block
        }

        .pull-left {
            float: left
        }

        .dialog .dialog-head .close-btn,
        .edit-dialog .pull-right,
        .header-v2 .nav,
        .paper-dialog .paper-questions li i,
        .paper-dialog .pull-right,
        .pull-right {
            float: right
        }

        .table-cell {
            display: table-cell
        }

        .center {
            text-align: center
        }

        .font-10 {
            font-size: 10px
        }

        .h5-font-10 {
            font-size: .5rem
        }

        .font-12 {
            font-size: 12px
        }

        .h5-font-12 {
            font-size: .6rem
        }

        .font-14 {
            font-size: 14px
        }

        .h5-font-14 {
            font-size: .7rem
        }

        .font-16 {
            font-size: 16px
        }

        .h5-font-16 {
            font-size: .8rem
        }

        .font-18 {
            font-size: 18px
        }

        .h5-font-18 {
            font-size: .9rem
        }

        .font-20 {
            font-size: 20px
        }

        .h5-font-20 {
            font-size: 1rem
        }

        #finish-tip,
        .font-22 {
            font-size: 22px
        }

        .h5-font-22 {
            font-size: 1.1rem
        }

        .font-24 {
            font-size: 24px
        }

        .h5-font-24 {
            font-size: 1.2rem
        }

        .font-32 {
            font-size: 32px
        }

        .h5-font-32 {
            font-size: 1.6rem
        }

        .align-left {
            text-align: left
        }

        .align-right {
            text-align: right
        }

        .btn,
        .btn-arc {
            background-color: #999;
            border: none;
            display: inline-block;
            text-align: center;
            -webkit-border-radius: .2rem;
            -moz-border-radius: .2rem;
            -o-border-radius: .2rem;
            border-radius: .2rem
        }

        .btn-arc {
            border-radius: 0 0 50% 50%/0 0 .5rem .5rem
        }

        .btn-green {
            background-color: #48D1AE
        }

        .btn-blackish-green {
            background-color: #009688
        }

        .btn-orange {
            background-color: #ff8755
        }

        .btn-yellow {
            background-color: #F5A623
        }

        .tip-badge {
            display: inline-block;
            background: rgba(82, 211, 179, .3);
            border: 1px solid #4cbea1
        }

        .header-v2 {
            background: #fff;
            height: 58px;
            line-height: 58px;
            border-bottom: 2px solid #4cbea1;
            box-shadow: 0 2px 2px 0 rgba(0, 0, 0, .1);
            font-size: 0
        }

        .header-v2 .course-info {
            display: inline-block
        }

        .header-v2 .course-info .logo img {
            width: 130px;
            height: 58px
        }

        .header-v2 .course-info .code {
            display: inline-block;
            text-align: center;
            font-size: 12px;
            color: #666;
            vertical-align: top
        }

        .header-v2 .course-info .back {
            display: inline-block;
            vertical-align: top;
            color: #4a4a4a;
            font-size: 12px;
            margin-left: 10px
        }

        .header-v2 .course-info .course-name {
            display: inline-block;
            min-width: 280px;
            cursor: pointer;
            padding: 0 10px 0 15px;
            font-size: 16px;
            color: rgba(0, 0, 0, .87);
            border-right: 1px solid rgba(0, 0, 0, .12);
            vertical-align: top
        }

        .header-v2 .course-info .course-name .name {
            display: inline-block;
            vertical-align: top;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap
        }

        .header-v2 .course-info .course-name .icon-down {
            float: right;
            margin-top: 25px;
            width: 0;
            height: 0;
            border-top: 5px solid #555;
            border-bottom: 5px solid transparent;
            border-left: 5px solid transparent;
            border-right: 5px solid transparent
        }

        .header-v2 .course-info .course-name:hover {
            background-color: #f7f7f7
        }

        .header-v2 .course-info .icon-home {
            width: 12px;
            height: 10px;
            background: url(../images/home-v2.png);
            background-size: 100%;
            margin-left: 5px;
            vertical-align: -1px
        }

        .header-v2 .course-info .course-list {
            position: absolute;
            display: none;
            top: 58px;
            left: 130px;
            z-index: 100000;
            background: #fff;
            box-shadow: 0 8px 8px 0 rgba(0, 0, 0, .24), 0 0 8px 0 rgba(0, 0, 0, .12)
        }

        .header-v2 .course-info .course-list .title {
            color: #adadad;
            font-size: 10px;
            line-height: 25px;
            padding: 0 10px
        }

        .header-v2 .course-info .course-list .item {
            height: 30px;
            line-height: 30px
        }

        .header-v2 .course-info .course-list .item a {
            display: inline-block;
            width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            color: #333;
            font-size: 14px;
            padding: 0 10px
        }

        .header-v2 .course-info .course-list .item:hover {
            background-color: #eee
        }

        .header-v2 .nav {
            font-size: 14px
        }

        .header-v2 .nav .icon {
            margin-right: 5px
        }

        .header-v2 .nav .nav-btn {
            display: inline-block;
            width: 100px;
            text-align: center;
            color: rgba(0, 0, 0, .6);
            background-color: #fff;
            cursor: pointer
        }

        .header-v2 .nav .checkin-btn .icon-checkin {
            width: 16px;
            height: 16px;
            background: url(../images/checkin-black.png);
            background-size: 100%;
            vertical-align: -2px
        }

        .header-v2 .nav .answer-btn .icon-answer {
            width: 16px;
            height: 16px;
            background: url(../images/answer-black.png);
            background-size: 100%;
            vertical-align: -2px
        }

        .header-v2 .nav .courseware-btn .icon-file {
            width: 16px;
            height: 16px;
            background: url(../images/courseware-black.png);
            background-size: 100%;
            vertical-align: -2px
        }

        .header-v2 .nav .message-btn .icon-message {
            width: 17px;
            height: 16px;
            background: url(../images/message-black.png);
            background-size: 100%
        }

        .header-v2 .nav .checked {
            color: #fff;
            background-color: #4cbea1
        }

        .header-v2 .nav .checked .icon-checkin {
            background: url(../images/checkin-white.png);
            background-size: 100%
        }

        .header-v2 .nav .checked .icon-answer {
            background: url(../images/answer-white.png);
            background-size: 100%
        }

        .header-v2 .nav .checked .icon-file {
            background: url(../images/courseware-white.png);
            background-size: 100%
        }

        .header-v2 .nav .checked .icon-message {
            background: url(../images/message-white.png);
            background-size: 100%
        }

        .paper-dialog {
            display: none;
            position: absolute;
            top: 100px;
            right: 0;
            padding: 15px 20px;
            background: #fff;
            -webkit-box-shadow: 0 0 5px #666;
            -moz-box-shadow: 0 0 5px #666;
            -o-box-shadow: 0 0 5px #666;
            box-shadow: 0 0 5px #666;
            -webkit-border-radius: 4px 0 0 4px;
            -moz-border-radius: 4px 0 0 4px;
            -o-border-radius: 4px 0 0 4px;
            border-radius: 4px 0 0 4px;
            z-index: 1000000
        }

        .paper-dialog [type=text] {
            font-size: 14px;
            height: auto
        }

        .paper-dialog .paper-questions {
            width: 425px;
            max-height: 574px;
            overflow-y: auto
        }

        .paper-dialog .paper-questions li {
            margin: 10px 0;
            line-height: 20px;
            cursor: pointer
        }

        .paper-dialog .paper-questions li span {
            display: inline-block;
            width: 385px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap
        }

        .paper-dialog .paper-questions li:hover {
            color: #999
        }

        .paper-dialog .input input {
            width: 185px;
            padding: 8px;
            border: 1px solid #979797;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -o-border-radius: 4px;
            border-radius: 4px
        }

        .paper-dialog .alert {
            color: #e45757
        }

        .paper-dialog .alert input {
            border: 1px solid #e45757
        }

        .paper-dialog .btn,
        .paper-dialog .btn-arc {
            border: none;
            height: auto;
            line-height: normal;
            padding: 10px 15px;
            color: #fff;
            cursor: pointer;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -o-border-radius: 4px;
            border-radius: 4px
        }

        .paper-dialog .btn-cancle {
            background-color: #999
        }

        .paper-dialog .btn-cancle:hover {
            background-color: #CBCBCB
        }

        .paper-dialog .btn-create {
            background-color: #48D1AE
        }

        .paper-dialog .btn-create:hover {
            background-color: #9FE0CC
        }

        .paper-dialog .icon-delete {
            width: 16px;
            height: 16px;
            background: url(../images/delete-paper.png)
        }

        .paper-dialog .green {
            color: #48D1AE
        }

        .dialog-wrapper {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, .4);
            z-index: 10000
        }

        .dialog-outer {
            display: table-cell;
            vertical-align: middle
        }

        .dialog {
            width: 600px;
            margin: 0 auto;
            border: 1px solid #48D1AE;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            -o-border-radius: 5px;
            border-radius: 5px
        }

        .dialog .dialog-head {
            color: #fff;
            background-color: #48D1AE;
            padding: 7px
        }

        .dialog .dialog-head .close-btn {
            background: url(../images/wrong.png) center center no-repeat;
            display: inline-block;
            width: 16px;
            height: 16px
        }

        .dialog .dialog-content {
            padding: 20px 5px;
            background: #fff;
            text-align: center
        }

        .dialog .dialog-content img {
            max-height: 560px;
            max-width: 560px
        }

        .dialog .dialog-foot {
            padding: 15px 10px;
            text-align: right;
            background-color: #DADFDA
        }

        .dialog .dialog-foot .dialog-btn {
            display: inline-block;
            width: 50px;
            line-height: 26px;
            text-align: center;
            margin-right: 15px;
            color: #fff;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -o-border-radius: 4px;
            border-radius: 4px
        }

        .dialog .dialog-foot .dialog-confirm {
            background-color: #48D1AE
        }

        .dialog .dialog-foot .dialog-cancel {
            background-color: #CBCBCB
        }

        .dialog-wrapper.delete-paper-dialog .type-item .delete-select,
        .dialog-wrapper.delete-paper-dialog .type-paper .delete-item {
            display: none
        }

        .dialog-wrapper.delete-paper-dialog .delete-select {
            width: 380px;
            margin: 0 auto
        }

        .dialog-wrapper.delete-paper-dialog .delete-select li {
            line-height: 36px;
            cursor: pointer;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -o-border-radius: 4px;
            border-radius: 4px
        }

        .dialog-wrapper.delete-paper-dialog .delete-select .actived {
            background-color: #DADFDA
        }

        #column:after,
        #column:before,
        #scores:after,
        #scores:before,
        .content .right-area:after,
        .content .right-area:before,
        .content:after,
        .content:before,
        .paper-data .paper-head .buttons:after,
        .paper-data .paper-head .buttons:before,
        .question-tabs:after,
        .question-tabs:before,
        .question-wrap .answer-cont:after,
        .question-wrap .answer-cont:before,
        .question-wrap .buttons:after,
        .question-wrap .buttons:before,
        .subject-data .question-wrap .buttons:after,
        .subject-data .question-wrap .buttons:before {
            content: " ";
            display: table
        }

        #change_password {
            position: absolute;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            margin: auto
        }

        .edit-dialog .icon,
        .header-v2 .icon,
        .icon {
            display: inline-block;
            vertical-align: middle;
            background-repeat: no-repeat
        }

        .edit-dialog {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
            font-size: 14px;
            padding: 40px 0;
            box-sizing: border-box;
            background-color: rgba(0, 0, 0, .2)
        }

        .edit-dialog * {
            box-sizing: content-box
        }

        .edit-dialog .edit-warpper {
            width: 1020px;
            height: 100%;
            margin: 0 auto
        }

        .edit-dialog .mb-15 {
            margin-bottom: 15px
        }

        .edit-dialog .mr-5 {
            margin-right: 5px
        }

        .edit-dialog .mr-10 {
            margin-right: 10px
        }

        .edit-dialog .pl-20 {
            padding-left: 20px
        }

        .edit-dialog .table-cell {
            display: table-cell
        }

        .edit-dialog .pull-left {
            float: left
        }

        .edit-dialog p {
            margin: 0
        }

        .edit-dialog .edit-area {
            position: relative;
            display: inline-block;
            width: 650px;
            height: 100%;
            vertical-align: top;
            margin-left: auto;
            margin-right: 50px;
            -webkit-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .26), 0 2px 10px 0 rgba(0, 0, 0, .16);
            -moz-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .26), 0 2px 10px 0 rgba(0, 0, 0, .16);
            -o-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .26), 0 2px 10px 0 rgba(0, 0, 0, .16);
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .26), 0 2px 10px 0 rgba(0, 0, 0, .16)
        }

        .edit-dialog .edit-area ::-webkit-scrollbar {
            width: 10px;
            height: 10px
        }

        .edit-dialog .edit-area ::-webkit-scrollbar-track {
            background-color: #fff
        }

        .edit-dialog .edit-area ::-webkit-scrollbar-thumb {
            background-color: #aaa;
            border-radius: 100px
        }

        .edit-dialog .edit-area ::-webkit-scrollbar-button {
            display: none
        }

        .edit-dialog .edit-area ::-webkit-scrollbar-corner {
            background-color: #fff
        }

        .edit-dialog .edit-area .edit-wrap {
            position: relative;
            top: -57px;
            width: 100%;
            height: 100%;
            margin: 0;
            color: #666;
            padding: 72px 20px 72px 60px;
            background-color: #fff;
            overflow-y: auto;
            overflow-x: hidden;
            box-sizing: border-box;
            z-index: 0
        }

        .edit-dialog .edit-area .edit-wrap .edit-item {
            position: relative;
            margin-bottom: 10px;
            cursor: pointer
        }

        .edit-dialog .edit-area .edit-wrap .edit-item .item-title {
            display: inline-block;
            width: 50px;
            margin-left: -50px;
            color: #666
        }

        .edit-dialog .edit-area .edit-wrap .edit-item input[name=blank-value],
        .edit-dialog .edit-area .edit-wrap .edit-item input[name=option-value],
        .edit-dialog .edit-area .edit-wrap .edit-item textarea[name=answer-value] {
            display: inline-block;
            line-height: 23px;
            width: 400px;
            height: 26px;
            padding: 5px;
            font-size: 14px;
            border: 1px solid #999
        }

        .edit-dialog .edit-area .edit-wrap .edit-item input[name=blank-value]:focus,
        .edit-dialog .edit-area .edit-wrap .edit-item input[name=option-value]:focus,
        .edit-dialog .edit-area .edit-wrap .edit-item textarea[name=answer-value]:focus {
            border: 1px solid #999;
            box-shadow: none
        }

        .edit-dialog .edit-area .edit-wrap .edit-item .delete {
            margin-top: 10px;
            margin-left: 20px;
            width: 16px;
            height: 16px;
            background: url(../images/edit-question/message_delete.png);
            background-size: 100%;
            vertical-align: top
        }

        .edit-dialog .edit-area .edit-wrap .edit-item .picture-uploader {
            position: relative;
            display: inline-block;
            vertical-align: bottom;
            margin-bottom: 5px;
            width: 25px;
            height: 25px;
            margin-left: -40px;
            background: url(../images/edit-question/add-file.png) no-repeat;
            background-size: 100%
        }

        .edit-dialog .edit-area .edit-wrap .edit-item .picture-uploader:hover~.upload-warpper {
            display: block
        }

        .edit-dialog .edit-area .edit-wrap .edit-item .uploadify-button {
            display: inline-block;
            width: 100%;
            height: 100%;
            margin-top: -30px;
            color: #009688;
            text-decoration: underline
        }

        .edit-dialog .edit-area .edit-wrap .edit-item .edit-box {
            min-height: 112px;
            height: 100%;
            padding: 8px;
            width: 301px;
            border: none
        }

        .edit-dialog .edit-area .edit-wrap .edit-item>label {
            color: #444
        }

        .edit-dialog .edit-area .edit-wrap .edit-item>label .help-icon {
            border-radius: 50%;
            margin-left: 5px;
            color: #fff;
            background-color: #999;
            font-size: 12px;
            width: 16px;
            text-align: center;
            line-height: 16px;
            height: 16px
        }

        .edit-dialog .edit-area .edit-wrap .edit-item.edit-case-sensitive,
        .edit-dialog .edit-area .edit-wrap .edit-item.edit-score-check,
        .edit-dialog .edit-area .edit-wrap .edit-item.edit-strict {
            float: left;
            margin-right: 16px
        }

        .edit-dialog .edit-area .edit-wrap .clearfix::after {
            content: "";
            clear: both;
            display: table
        }

        .edit-dialog .edit-area .edit-wrap li.edit-item:last-child:not(:first-child) {
            margin-bottom: 60px
        }

        .edit-dialog .edit-area .edit-wrap [type=checkbox],
        .edit-dialog .edit-area .edit-wrap [type=radio] {
            position: relative;
            left: 0;
            width: 16px;
            height: 16px;
            vertical-align: middle;
            margin-right: 5px;
            opacity: 1;
            filter: alpha(opacity=100)
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-type .type-select {
            display: inline-block;
            width: 120px;
            height: 36px;
            border: 1px solid #999
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-type .right-answer {
            float: right;
            margin: 20px 10px 0 0
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-type .estimate {
            display: inline-block;
            font-size: 16px;
            margin-left: 30px;
            color: #666
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-type [name=estimate-time] {
            font-size: 12px;
            width: 44px;
            height: 18px;
            line-height: 18px;
            padding: 8px;
            border: 1px solid #9b9b9b;
            text-align: right;
            margin: 0 5px;
            color: #666
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-type [name=estimate-time]:focus {
            border: 1px solid #9b9b9b;
            box-shadow: none
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-diff {
            margin-bottom: 16px
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-diff .icon {
            width: 18px;
            height: 18px
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-diff .icon-star-light {
            background: url(../images/edit-question/star-light.png);
            background-size: 100%
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-diff .icon-star-deep {
            background: url(../images/edit-question/star-deep.png);
            background-size: 100%
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-option {
            position: relative;
            margin-bottom: 15px
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-option input {
            margin: 0
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-option input[name=choice] {
            position: absolute;
            top: 10px;
            left: auto;
            right: 30px;
            width: 16px;
            height: 16px;
            opacity: 1;
            filter: alpha(opacity=100)
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-option .img-wrap {
            position: relative;
            display: inline-block;
            width: 400px;
            padding: 5px;
            border: 1px solid #999
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-option .img-wrap img {
            width: 110px;
            height: 80px
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-option .img-wrap .icon-delete-image {
            position: absolute;
            top: -4px;
            left: 105px;
            width: 18px;
            height: 18px;
            background: url(../images/edit-question/wrong.png) center no-repeat #999;
            background-size: 60%;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            -o-border-radius: 50%;
            border-radius: 50%
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-option .icon-lable {
            vertical-align: top;
            width: 28px;
            height: 36px;
            margin-left: -28px;
            background: url(../images/edit-question/list.png) center no-repeat #fff;
            background-size: 60%;
            border: 1px solid #999;
            border-right: none;
            -webkit-border-radius: 4px 0 0 4px;
            -moz-border-radius: 4px 0 0 4px;
            -o-border-radius: 4px 0 0 4px;
            border-radius: 4px 0 0 4px
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-option .upload-warpper {
            bottom: -152px;
            left: 180px
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-option .swfupload {
            position: absolute
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-option .delete {
            position: absolute;
            top: 0;
            left: 400px
        }

        .edit-dialog .edit-area .edit-wrap .edit-option-create {
            width: 400px
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-dispute .dispute-item {
            position: relative;
            display: block;
            width: 112px;
            line-height: 36px;
            padding: 0 3px;
            border: 1px solid #999
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-dispute .dispute-item [name=dispute] {
            position: absolute;
            top: 10px;
            left: auto;
            right: -80px;
            width: 16px;
            height: 16px;
            opacity: 1;
            filter: alpha(opacity=100)
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-dispute .icon-yes {
            width: 20px;
            height: 20px;
            background: url(../images/edit-question/yes.png);
            background-size: 100%
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-dispute .icon-no {
            width: 20px;
            height: 20px;
            background: url(../images/edit-question/no.png);
            background-size: 100%
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-blank {
            position: relative;
            width: 480px;
            line-height: 36px
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-blank .delete {
            position: absolute;
            top: 0;
            right: -60px
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-blank .blank-tip {
            color: red;
            font-size: 12px;
            line-height: 20px
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-blank .index-grey,
        .edit-dialog .edit-area .edit-wrap .edit-question-blank .index-yellow {
            position: absolute;
            width: 16px;
            height: 16px;
            top: 10px;
            left: 3px;
            font-size: 12px;
            text-align: center;
            line-height: 16px;
            color: #333;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            -o-border-radius: 50%;
            border-radius: 50%
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-blank .index-yellow {
            background: #fdbe41
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-blank .index-grey {
            background: #c8c8c8
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-blank input[name=blank-value] {
            width: 400px;
            padding-left: 25px;
            margin: 0
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-blank.hasScore {
            width: 500px
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-blank.hasScore input[name=blank-score] {
            width: 30px;
            margin-left: 5px;
            display: inline-block;
            line-height: 23px;
            height: 26px;
            padding: 5px;
            font-size: 14px;
            border: 1px solid #999
        }

        .edit-dialog .edit-area .edit-wrap .edit-blank-create {
            width: 418px
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-text #editor {
            display: inline-block;
            vertical-align: top
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-text .picture-uploader {
            position: absolute;
            z-index: 10000;
            bottom: 5px;
            right: 5px
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-text .upload-warpper {
            bottom: -148px;
            right: -10px
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-text .upload-warpper .icon-file {
            left: auto;
            right: 12px
        }

        .edit-dialog .edit-area .edit-wrap .edit-question-text .index {
            display: inline-block;
            width: 14px;
            height: 14px;
            padding: 0 5px;
            text-decoration: underline;
            background-color: rgba(253, 190, 65, .5);
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            -o-border-radius: 50%;
            border-radius: 50%
        }

        .edit-dialog .edit-area .edit-wrap .edit-answer-text {
            position: relative;
            width: 400px;
            line-height: 36px
        }

        .edit-dialog .edit-area .edit-wrap .edit-answer-text textarea[name=answer-value] {
            margin: 0;
            height: 100px
        }

        .edit-dialog .edit-area .edit-wrap .edit-answer-text .delete {
            position: absolute;
            top: 0;
            right: -60px
        }

        .edit-dialog .edit-area .edit-wrap .edit-answer-type {
            margin-bottom: 20px
        }

        .edit-dialog .edit-area .edit-wrap .edit-answer-type .answerTip {
            margin-top: 10px;
            font-size: 12px;
            color: #9b9b9b
        }

        .edit-dialog .edit-area .edit-wrap .edit-answer-create {
            width: 120px
        }

        .content .edit-dialog .edit-area .edit-wrap .right-area:after,
        .content .edit-dialog .edit-area .edit-wrap .right-area:before,
        .edit-dialog .edit-area .edit-wrap #column:after,
        .edit-dialog .edit-area .edit-wrap #column:before,
        .edit-dialog .edit-area .edit-wrap #scores:after,
        .edit-dialog .edit-area .edit-wrap #scores:before,
        .edit-dialog .edit-area .edit-wrap .content .right-area:after,
        .edit-dialog .edit-area .edit-wrap .content .right-area:before,
        .edit-dialog .edit-area .edit-wrap .content:after,
        .edit-dialog .edit-area .edit-wrap .content:before,
        .edit-dialog .edit-area .edit-wrap .paper-data .paper-head .buttons:after,
        .edit-dialog .edit-area .edit-wrap .paper-data .paper-head .buttons:before,
        .edit-dialog .edit-area .edit-wrap .question-tabs:after,
        .edit-dialog .edit-area .edit-wrap .question-tabs:before,
        .edit-dialog .edit-area .edit-wrap .question-wrap .answer-cont:after,
        .edit-dialog .edit-area .edit-wrap .question-wrap .answer-cont:before,
        .edit-dialog .edit-area .edit-wrap .question-wrap .buttons:after,
        .edit-dialog .edit-area .edit-wrap .question-wrap .buttons:before,
        .paper-data .paper-head .edit-dialog .edit-area .edit-wrap .buttons:after,
        .paper-data .paper-head .edit-dialog .edit-area .edit-wrap .buttons:before,
        .question-wrap .edit-dialog .edit-area .edit-wrap .answer-cont:after,
        .question-wrap .edit-dialog .edit-area .edit-wrap .answer-cont:before,
        .question-wrap .edit-dialog .edit-area .edit-wrap .buttons:after,
        .question-wrap .edit-dialog .edit-area .edit-wrap .buttons:before {
            content: " ";
            display: table
        }

        .edit-dialog .edit-area .edit-wrap #change_password {
            position: absolute;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            margin: auto
        }

        .edit-dialog .edit-area .edit-wrap .icon {
            display: inline-block;
            vertical-align: middle;
            background-repeat: no-repeat
        }

        .edit-dialog .edit-area .edit-wrap .hidden {
            display: none
        }

        .edit-dialog .edit-area .edit-wrap .upload-warpper {
            display: none;
            position: absolute;
            width: 335px;
            height: 100px;
            background: #fff;
            z-index: 10000;
            cursor: default;
            border: 2px solid #009688;
            padding: 35px;
            -webkit-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .26), 0 2px 10px 0 rgba(0, 0, 0, .16);
            -moz-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .26), 0 2px 10px 0 rgba(0, 0, 0, .16);
            -o-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .26), 0 2px 10px 0 rgba(0, 0, 0, .16);
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .26), 0 2px 10px 0 rgba(0, 0, 0, .16)
        }

        .edit-dialog .edit-area .edit-wrap .upload-warpper .content,
        .edit-dialog .edit-footer,
        .edit-dialog .edit-header,
        .edit-dialog .inputField .blank {
            position: relative
        }

        .edit-dialog .edit-area .edit-wrap .upload-warpper:hover {
            display: block
        }

        .edit-dialog .edit-area .edit-wrap .upload-warpper .upload-file {
            display: inline-block;
            width: 96px;
            height: 42px;
            vertical-align: top;
            color: #16b48c
        }

        .edit-dialog .edit-area .edit-wrap .upload-warpper .icon-upload {
            margin-top: 25px;
            width: 66px;
            height: 48px;
            background: url(../images/edit-question/upload.png);
            background-size: 100%
        }

        .edit-dialog .edit-area .edit-wrap .upload-warpper .icon-file {
            position: absolute;
            top: -16px;
            left: 50%;
            margin-left: -16px;
            width: 32px;
            height: 32px;
            background: url(../images/edit-question/file.png);
            background-size: 100%
        }

        .edit-dialog .edit-area .edit-wrap .upload-warpper [name=Filedata] {
            cursor: pointer;
            width: 160px
        }

        .edit-dialog .edit-area .edit-wrap .upload-warpper form {
            position: absolute;
            top: 0;
            left: -50px;
            width: 100px;
            opacity: 0
        }

        .edit-dialog .edit-header {
            padding: 10px 20px;
            line-height: 36px;
            height: 36px;
            margin: 0 auto;
            font-size: 16px;
            color: #4a4a4a;
            background-color: #f2f2f2;
            z-index: 10;
            border-bottom: 1px solid #c8c8c8;
            -webkit-border-radius: 4px 4px 0 0;
            -moz-border-radius: 4px 4px 0 0;
            -o-border-radius: 4px 4px 0 0;
            border-radius: 4px 4px 0 0
        }

        .edit-dialog .edit-header .icon-course {
            width: 25px;
            height: 24px;
            margin-right: 10px;
            background: url(../images/edit-question/course.png);
            background-size: 100%
        }

        .edit-dialog .edit-header .icon-delete {
            cursor: pointer;
            width: 24px;
            height: 24px;
            background: url(../images/edit-question/wrong.png) center no-repeat #999;
            background-size: 60%;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            -o-border-radius: 50%;
            border-radius: 50%
        }

        .edit-dialog .edit-header .course-name {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            max-width: 150px;
            display: inline-block;
            vertical-align: middle
        }

        .edit-dialog .edit-header .longer {
            max-width: 450px
        }

        .edit-dialog .edit-header select {
            display: inline;
            width: 325px;
            height: 20px;
            border: 1px solid rgba(0, 0, 0, .12);
            font-size: 14px
        }

        .edit-dialog .edit-header select option {
            padding: 10px
        }

        .edit-dialog .edit-footer {
            top: -114px;
            padding: 10px 20px;
            line-height: 36px;
            height: 36px;
            margin: 0 auto;
            color: #4a4a4a;
            background-color: #f2f2f2;
            z-index: 10;
            border-top: 1px solid #c8c8c8;
            -webkit-border-radius: 0 0 4px 4px;
            -moz-border-radius: 0 0 4px 4px;
            -o-border-radius: 0 0 4px 4px;
            border-radius: 0 0 4px 4px
        }

        .edit-dialog .edit-footer .question-info {
            margin-left: 20px
        }

        .edit-dialog .edit-footer .quetion-type {
            color: red
        }

        .edit-dialog .edit-footer .btn,
        .edit-dialog .edit-footer .btn-arc {
            height: 36px;
            line-height: 36px;
            outline: 0;
            color: #fff;
            border: none;
            background-color: #26a69a;
            letter-spacing: .5px;
            padding: 0 15px;
            transition: .2s ease-out;
            cursor: pointer;
            border-radius: .2rem;
            vertical-align: middle;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .16), 0 2px 10px 0 rgba(0, 0, 0, .12)
        }

        .edit-dialog .edit-footer .btn-arc:hover,
        .edit-dialog .edit-footer .btn:hover {
            box-shadow: 0 5px 11px 0 rgba(0, 0, 0, .18), 0 4px 15px 0 rgba(0, 0, 0, .15)
        }

        .edit-dialog .edit-footer .btn-close {
            margin-right: 20px;
            color: #26a69a;
            background-color: #fff
        }

        .edit-dialog .edit-footer .icon-course {
            width: 25px;
            height: 24px;
            margin-right: 10px;
            background: url(../images/edit-question/course.png);
            background-size: 100%
        }

        .edit-dialog .question-item .type-1 {
            border-color: #53d4b3
        }

        .edit-dialog .question-item .type-2 {
            border-color: #00ccde
        }

        .edit-dialog .question-item .type-3 {
            border-color: #f5a623
        }

        .edit-dialog .question-item .type-4 {
            border-color: #9b9b9b
        }

        .edit-dialog .question-item .type-5 {
            border-color: #9013fe
        }

        .edit-dialog .question-content {
            border-left: 4px solid #fff;
            padding-left: 4px;
            font-size: 16px;
            margin-bottom: 15px
        }

        .edit-dialog .inputField label {
            display: block;
            font-size: 14px;
            color: #333;
            margin-bottom: 10px
        }

        .edit-dialog .inputField label [name=preview-choice] {
            position: relative;
            width: 14px;
            height: 14px;
            left: 0;
            margin-top: 2px;
            margin-right: 5px;
            vertical-align: top;
            opacity: 1;
            filter: alpha(opacity=100)
        }

        .edit-dialog .inputField .blank .index {
            position: absolute;
            width: 16px;
            height: 16px;
            line-height: 16px;
            top: 10px;
            left: 3px;
            background: #fdbe41;
            color: #333;
            font-size: 12px;
            text-align: center;
            overflow: auto;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            -o-border-radius: 50%;
            border-radius: 50%
        }

        .edit-dialog .inputField .blank .blank-filed {
            width: 100%;
            height: 36px;
            line-height: 36px;
            margin-bottom: 4px;
            padding: 0;
            resize: none;
            text-indent: 22px;
            box-sizing: border-box
        }

        .edit-dialog .inputField .answer-content {
            padding: 4px;
            width: 100%;
            height: 100px;
            margin-bottom: 4px;
            box-sizing: border-box
        }

        .edit-dialog .inputField .add-area {
            display: inline-block;
            width: 33.33%
        }

        .edit-dialog .inputField .add-area .wrapper {
            padding: 80px 5px 5px;
            width: 80%;
            border: 1px dashed #9b9b9b;
            border-radius: 2px
        }

        .edit-dialog .inputField .add-area .wrapper:nth-child(1) {
            margin: 0 auto
        }

        .edit-dialog .inputField .add-area .wrapper:last-child {
            margin-left: auto
        }

        .edit-dialog .inputField .icon-add {
            width: 15px;
            height: 15px;
            background: url(../images/edit-question/add.png);
            background-size: 100%;
            vertical-align: middle
        }

        .edit-dialog .inputField img {
            max-width: 90%
        }

        .edit-dialog .edit-preview {
            position: relative;
            display: inline-block;
            width: 320px;
            height: 650px;
            background: url(../images/edit-question/preview-bg.png);
            background-size: 100%;
            color: #333
        }

        .edit-dialog .edit-preview img {
            max-width: 100%
        }

        .edit-dialog .edit-preview p {
            margin: 0
        }

        .edit-dialog .edit-preview ::-webkit-scrollbar {
            width: 10px;
            height: 10px
        }

        .edit-dialog .edit-preview ::-webkit-scrollbar-track {
            background-color: #fff
        }

        .edit-dialog .edit-preview ::-webkit-scrollbar-thumb {
            background-color: #dedede;
            border-radius: 100px
        }

        .edit-dialog .edit-preview ::-webkit-scrollbar-button {
            display: none
        }

        .edit-dialog .edit-preview ::-webkit-scrollbar-corner {
            background-color: #fff
        }

        .edit-dialog .question-wrapper {
            width: 269px;
            height: 440px;
            padding: 5px;
            background: #fff;
            margin: 122px auto 0;
            overflow-y: auto
        }

        .content .edit-dialog .right-area:after,
        .content .edit-dialog .right-area:before,
        .edit-dialog #column:after,
        .edit-dialog #column:before,
        .edit-dialog #scores:after,
        .edit-dialog #scores:before,
        .edit-dialog .content .right-area:after,
        .edit-dialog .content .right-area:before,
        .edit-dialog .content:after,
        .edit-dialog .content:before,
        .edit-dialog .paper-data .paper-head .buttons:after,
        .edit-dialog .paper-data .paper-head .buttons:before,
        .edit-dialog .question-tabs:after,
        .edit-dialog .question-tabs:before,
        .edit-dialog .question-wrap .answer-cont:after,
        .edit-dialog .question-wrap .answer-cont:before,
        .edit-dialog .question-wrap .buttons:after,
        .edit-dialog .question-wrap .buttons:before,
        .paper-data .paper-head .edit-dialog .buttons:after,
        .paper-data .paper-head .edit-dialog .buttons:before,
        .question-wrap .edit-dialog .answer-cont:after,
        .question-wrap .edit-dialog .answer-cont:before,
        .question-wrap .edit-dialog .buttons:after,
        .question-wrap .edit-dialog .buttons:before {
            content: " ";
            display: table
        }

        .edit-dialog #change_password {
            position: absolute;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            margin: auto
        }

        .edit-dialog .header-v2 .icon,
        .edit-dialog .icon,
        .header-v2 .edit-dialog .icon {
            display: inline-block;
            vertical-align: middle;
            background-repeat: no-repeat
        }

        .edit-dialog .edit-area .edit-wrap .edit-answer-create,
        .edit-dialog .edit-area .edit-wrap .edit-blank-create,
        .edit-dialog .edit-area .edit-wrap .edit-option-create {
            position: relative;
            margin-bottom: 15px;
            line-height: 24px;
            padding: 5px 6px;
            color: #999;
            border: 1px dashed #c8c8c8;
            font-size: 12px
        }

        .edit-dialog .hidden {
            display: none
        }

        .edit-dialog .dialog-wrapper {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, .4);
            z-index: 10000
        }

        .edit-dialog .dialog-outer {
            display: table-cell;
            vertical-align: middle
        }

        .edit-dialog .dialog {
            width: 600px;
            margin: 0 auto;
            border: 1px solid #48D1AE;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            -o-border-radius: 5px;
            border-radius: 5px
        }

        .edit-dialog .dialog .dialog-head {
            color: #fff;
            background-color: #48D1AE;
            padding: 7px
        }

        .edit-dialog .dialog .dialog-head .close-btn {
            background: url(../images/edit-question/wrong.png) center center no-repeat;
            display: inline-block;
            width: 16px;
            height: 16px;
            float: right
        }

        .edit-dialog .dialog .dialog-content {
            padding: 20px 5px;
            background: #fff;
            text-align: center
        }

        .edit-dialog .dialog .dialog-content img {
            max-height: 560px;
            max-width: 560px
        }

        .edit-dialog .dialog .dialog-foot {
            padding: 15px 10px;
            text-align: right;
            background-color: #DADFDA
        }

        .edit-dialog .dialog .dialog-foot .dialog-btn {
            display: inline-block;
            width: 50px;
            line-height: 26px;
            text-align: center;
            margin-right: 15px;
            color: #fff;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -o-border-radius: 4px;
            border-radius: 4px
        }

        .edit-dialog .dialog .dialog-foot .dialog-confirm {
            background-color: #48D1AE
        }

        .edit-dialog .dialog .dialog-foot .dialog-cancel {
            background-color: #CBCBCB
        }

        .edit-dialog .edit-image-dialog {
            overflow: hidden
        }

        .edit-dialog .edit-image-dialog .dialog {
            width: 620px
        }

        .edit-dialog .edit-image-dialog .dialog .progress {
            height: auto;
            margin: 0;
            line-height: 160px;
            font-size: 32px;
            color: #48D1AE;
            background: 0 0
        }

        .edit-dialog .edit-image-dialog .dialog #upload-image {
            display: inline-block;
            vertical-align: top
        }

        .edit-dialog .edit-image-dialog .dialog .dialog-content {
            min-height: 220px;
            padding: 10px 30px;
            text-align: center
        }

        .edit-dialog .edit-image-dialog .dialog .dialog-content .jcrop-holder {
            margin: 0 auto
        }

        .edit-dialog .edit-image-dialog .dialog .dialog-content .icon-loading {
            width: 42px;
            height: 42px;
            background: url(../images/edit-question/loading.gif)
        }

        .edit-dialog .edit-image-dialog .dialog .dialog-foot {
            padding: 10px
        }

        @media screen and (max-height:700px) {
            .edit-dialog .cut-image-dialog .dialog .dialog-content {
                max-height: 480px;
                overflow-y: scroll
            }
        }

        @media screen and (max-height:600px) {
            .edit-dialog .cut-image-dialog .dialog .dialog-content {
                max-height: 400px;
                overflow-y: scroll
            }
        }

        .edit-dialog .link-dialog .dialog-content {
            padding: 20px 45px;
            text-align: left
        }

        .edit-dialog .link-dialog .dialog-content label {
            display: block;
            margin: 20px 0;
            width: 500px
        }

        .edit-dialog .link-dialog .dialog-content label input[type=text] {
            width: 400px;
            float: right
        }

        .edit-dialog .jcrop-holder {
            direction: ltr;
            text-align: left
        }

        .edit-dialog .jcrop-hline,
        .edit-dialog .jcrop-vline {
            background: #FFF;
            font-size: 0;
            position: absolute
        }

        .edit-dialog .jcrop-vline {
            height: 100%;
            width: 1px!important
        }

        .edit-dialog .jcrop-vline.right {
            right: 0
        }

        .edit-dialog .jcrop-hline {
            height: 1px!important;
            width: 100%
        }

        .edit-dialog .jcrop-hline.bottom {
            bottom: 0
        }

        .edit-dialog .jcrop-tracker {
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            height: 100%;
            width: 100%
        }

        .edit-dialog .jcrop-handle {
            background-color: #333;
            border: 1px solid #EEE;
            font-size: 1px;
            height: 7px;
            width: 7px
        }

        .edit-dialog .jcrop-handle.ord-n {
            left: 50%;
            margin-left: -4px;
            margin-top: -4px;
            top: 0
        }

        .edit-dialog .jcrop-handle.ord-s {
            bottom: 0;
            left: 50%;
            margin-bottom: -4px;
            margin-left: -4px
        }

        .edit-dialog .jcrop-handle.ord-e {
            margin-right: -4px;
            margin-top: -4px;
            right: 0;
            top: 50%
        }

        .edit-dialog .jcrop-handle.ord-w {
            left: 0;
            margin-left: -4px;
            margin-top: -4px;
            top: 50%
        }

        .edit-dialog .jcrop-handle.ord-nw {
            left: 0;
            margin-left: -4px;
            margin-top: -4px;
            top: 0
        }

        .edit-dialog .jcrop-handle.ord-ne {
            margin-right: -4px;
            margin-top: -4px;
            right: 0;
            top: 0
        }

        .edit-dialog .jcrop-handle.ord-se {
            bottom: 0;
            margin-bottom: -4px;
            margin-right: -4px;
            right: 0
        }

        .edit-dialog .jcrop-handle.ord-sw {
            bottom: 0;
            left: 0;
            margin-bottom: -4px;
            margin-left: -4px
        }

        .edit-dialog .jcrop-dragbar.ord-n,
        .edit-dialog .jcrop-dragbar.ord-s {
            height: 7px;
            width: 100%
        }

        .edit-dialog .jcrop-dragbar.ord-e,
        .edit-dialog .jcrop-dragbar.ord-w {
            height: 100%;
            width: 7px
        }

        .edit-dialog .jcrop-dragbar.ord-n {
            margin-top: -4px
        }

        .edit-dialog .jcrop-dragbar.ord-s {
            bottom: 0;
            margin-bottom: -4px
        }

        .edit-dialog .jcrop-dragbar.ord-e {
            margin-right: -4px;
            right: 0
        }

        .edit-dialog .jcrop-dragbar.ord-w {
            margin-left: -4px
        }

        .edit-dialog .jcrop-light .jcrop-hline,
        .edit-dialog .jcrop-light .jcrop-vline {
            background: #FFF;
            filter: alpha(opacity=70)!important;
            opacity: .7!important
        }

        .edit-dialog .jcrop-light .jcrop-handle {
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            background-color: #000;
            border-color: #FFF;
            border-radius: 3px
        }

        .edit-dialog .jcrop-dark .jcrop-hline,
        .edit-dialog .jcrop-dark .jcrop-vline {
            background: #000;
            filter: alpha(opacity=70)!important;
            opacity: .7!important
        }

        .edit-dialog .jcrop-dark .jcrop-handle {
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            background-color: #FFF;
            border-color: #000;
            border-radius: 3px
        }

        .edit-dialog .solid-line .jcrop-hline,
        .edit-dialog .solid-line .jcrop-vline {
            background: #FFF
        }

        .edit-dialog .jcrop-holder img,
        .edit-dialog img.jcrop-preview {
            max-width: none
        }

        .left-wrapper {
            float: left;
            position: absolute;
            top: 0;
            left: 0;
            height: 100%
        }

        .label {
            display: inline-block;
            line-height: 22px;
            font-size: 12px;
            padding: 0 5px;
            color: #fff
        }

        .label-green {
            background-color: #48D1AE
        }

        .left-area {
            margin-left: 30px;
            padding-top: 30px;
            padding-bottom: 30px;
            height: 100%;
            box-sizing: border-box
        }

        .left-area ::-webkit-scrollbar {
            width: 10px;
            height: 10px
        }

        .left-area ::-webkit-scrollbar-track {
            background-color: #DADFDA
        }

        .left-area ::-webkit-scrollbar-thumb {
            background-color: #f4f4f4;
            border-radius: 100px
        }

        .left-area ::-webkit-scrollbar-button {
            display: none
        }

        .left-area ::-webkit-scrollbar-corner {
            background-color: #f4f4f4
        }

        .left-area .questions {
            width: 434px;
            overflow-y: auto;
            height: 568px;
            padding: 0 14px 0 22px;
            overflow-x: hidden;
            box-sizing: border-box;
            position: relative;
            top: 10px
        }

        .left-area .left-card {
            height: 92px;
            margin-bottom: 10px;
            -webkit-box-shadow: 0 0 2px rgba(0, 0, 0, .1);
            -moz-box-shadow: 0 0 2px rgba(0, 0, 0, .1);
            -o-box-shadow: 0 0 2px rgba(0, 0, 0, .1);
            box-shadow: 0 0 2px rgba(0, 0, 0, .1);
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -o-border-radius: 4px;
            border-radius: 4px;
            background-color: #fff;
            position: relative
        }

        .left-area .left-card:last-child {
            margin-bottom: 0
        }

        .left-area .add-btn {
            display: inline-block;
            margin-left: 21px;
            font-size: 20px;
            width: 196px;
            height: 70px;
            line-height: 70px;
            text-align: center;
            text-decoration: none;
            background-color: #48D1AE
        }

        .left-area .add-btn i {
            font-style: normal;
            color: #fff
        }

        .left-area .course-repo {
            background-color: #F5A623;
            margin-left: 0
        }

        .left-area .item {
            position: relative;
            padding: 12px 12px 20px
        }

        .left-area .item a {
            color: #000
        }

        .left-area .item .no-answer-question,
        .left-area .item .question {
            height: 100%;
            overflow: hidden;
            font-size: 14px
        }

        .left-area .item .no-answer-question a,
        .left-area .item .question a {
            color: #666
        }

        .left-area .item .no-answer-question {
            width: 100%
        }

        .left-area .item .que-num {
            position: absolute;
            width: 22px;
            height: 20px;
            background-color: #333;
            color: #fff;
            text-align: center;
            top: 4px;
            left: -22px;
            font-size: 12px
        }

        .left-area .item .answer-num,
        .left-area .item .create-time {
            font-size: 12px;
            font-weight: 700;
            color: #117A5F;
            position: absolute;
            right: 15px;
            bottom: 5px
        }

        .left-area .item .answer-num {
            left: 15px
        }

        .left-area .item .btn-group {
            position: absolute;
            right: 0;
            top: 0;
            display: none;
            font-size: 0
        }

        .left-area .item .delete-question-btn {
            -webkit-border-radius: 0 4px 0 0;
            -moz-border-radius: 0 4px 0 0;
            -o-border-radius: 0 4px 0 0;
            border-radius: 0 4px 0 0;
            background: url(../images/delete-question.png) center center no-repeat
        }

        .left-area .item .add-paper,
        .left-area .item .add-paper-disabled {
            right: 37px;
            -webkit-border-radius: 0;
            -moz-border-radius: 0;
            -o-border-radius: 0;
            border-radius: 0;
            background: url(../images/add-paper.png) center center no-repeat;
            border-right: 1px solid #fff
        }

        .left-area .item .clone-question-btn,
        .left-area .item .clone-question-btn-diabled {
            right: 75px;
            -webkit-border-radius: 0 0 0 4px;
            -moz-border-radius: 0 0 0 4px;
            -o-border-radius: 0 0 0 4px;
            border-radius: 0 0 0 4px;
            background: url(../images/clone-question.png) center center no-repeat;
            border-right: 1px solid #fff
        }

        .left-area .item .add-paper,
        .left-area .item .add-paper-disabled,
        .left-area .item .clone-question-btn,
        .left-area .item .clone-question-btn-diabled,
        .left-area .item .delete-question-btn {
            display: inline-block;
            width: 37px;
            height: 37px;
            background-color: #48D1AE;
            cursor: pointer
        }

        .left-area .item .add-paper-disabled:hover+.courseware-status::after,
        .left-area .item .add-paper-disabled:hover+.play-courseware::after,
        .left-area .item .add-paper-disabled:hover+.tip,
        .left-area .item .add-paper:hover+.courseware-status::after,
        .left-area .item .add-paper:hover+.play-courseware::after,
        .left-area .item .add-paper:hover+.tip,
        .left-area .item .clone-question-btn-diabled:hover+.courseware-status::after,
        .left-area .item .clone-question-btn-diabled:hover+.play-courseware::after,
        .left-area .item .clone-question-btn-diabled:hover+.tip,
        .left-area .item .clone-question-btn:hover+.courseware-status::after,
        .left-area .item .clone-question-btn:hover+.play-courseware::after,
        .left-area .item .clone-question-btn:hover+.tip,
        .left-area .item .delete-question-btn:hover+.courseware-status::after,
        .left-area .item .delete-question-btn:hover+.play-courseware::after,
        .left-area .item .delete-question-btn:hover+.tip {
            display: block
        }

        .left-area .item .add-paper-disabled,
        .left-area .item .clone-question-btn-diabled {
            background-color: #999
        }

        .left-area .item .courseware-status::after,
        .left-area .item .play-courseware::after,
        .left-area .item .tip {
            display: none;
            position: absolute;
            top: 40px;
            color: #fff;
            font-size: 12px;
            padding: 2px 5px;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -o-border-radius: 4px;
            border-radius: 4px;
            background: rgba(0, 0, 0, .8);
            z-index: 9999;
            text-align: center
        }

        .left-area .circle,
        .left-area .left,
        .left-area .right {
            height: 72px;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            -o-border-radius: 50%
        }

        .left-area .item .tip-pape {
            width: 110px;
            right: 3px
        }

        .left-area .item .tip-add-paper {
            width: 70px;
            right: 12px
        }

        .left-area .item .tip-clone-disabled {
            width: 85px;
            right: 50px
        }

        .left-area .item .tip-clone {
            width: 70px;
            right: 60px
        }

        .left-area .item .tip-used-paper {
            width: 80px;
            right: 23px
        }

        .left-area .item .tip-delete-paper {
            width: 60px;
            right: 0
        }

        .left-area .item:hover .btn-group {
            display: block
        }

        .left-area .score {
            float: left;
            padding: 0 12px
        }

        .left-area .circle {
            width: 72px;
            position: relative;
            border-radius: 50%;
            background: #fff
        }

        .left-area .pie_left,
        .left-area .pie_right {
            width: 72px;
            height: 72px;
            position: absolute;
            top: 0;
            left: 0
        }

        .left-area .left,
        .left-area .right {
            display: block;
            width: 72px;
            background: #48D1AE;
            border-radius: 50%;
            position: absolute;
            top: 0;
            left: 0
        }

        .left-area .pie_right,
        .left-area .right {
            clip: rect(0, auto, auto, 36px)
        }

        .left-area .left,
        .left-area .pie_left {
            clip: rect(0, 36px, auto, 0)
        }

        .left-area .mask {
            width: 60px;
            height: 60px;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            -o-border-radius: 50%;
            border-radius: 50%;
            font-size: 20px;
            left: 6px;
            top: 6px;
            position: absolute;
            text-align: center;
            background-color: #9FE0CC;
            border: 1px solid #fff;
            box-sizing: border-box;
            color: #fff
        }

        .content,
        .question-tabs {
            position: relative
        }

        .left-area .mask .percent {
            margin-top: 4px;
            display: inline-block;
            font-family: "微软雅黑", "Microsoft YaHei"
        }

        .left-area .mask .num {
            font-size: 12px;
            margin-top: 4px
        }

        .left-area .subjective-question .item .tip-clone {
            right: 25px
        }

        .question-tabs {
            width: 396px;
            left: 21px;
            height: 44px;
            margin: 0;
            text-align: center;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -o-border-radius: 4px;
            border-radius: 4px;
            background: #fff
        }

        .question-tabs li.tab_item {
            float: left;
            display: block;
            width: 50%;
            line-height: 44px;
            cursor: pointer;
            -webkit-transition: all .2s ease;
            -moz-transition: all .2s ease;
            -o-transition: all .2s ease;
            transition: all .2s ease
        }

        .question-tabs a {
            color: #333;
            display: block;
            width: 100%;
            height: 100%
        }

        .question-tabs li.checked {
            border-bottom: 4px solid #48D1AE
        }

        .question-tabs li.checked a {
            color: #48D1AE
        }

        .color-percent-0 .left,
        .color-percent-0 .right {
            background: #FF5722
        }

        .color-percent-0 .mask {
            background-color: #FFA184
        }

        .color-percent-20 .left,
        .color-percent-20 .right {
            background: #FF9800
        }

        .color-percent-20 .mask {
            background-color: #FFBE5E
        }

        .color-percent-40 .left,
        .color-percent-40 .right {
            background: #FFC107
        }

        .color-percent-40 .mask {
            background-color: #F8D786
        }

        .color-percent-60 .left,
        .color-percent-60 .right {
            background: #CDDC39
        }

        .color-percent-60 .mask {
            background-color: #DCE679
        }

        #question-nav,
        #question-nav .nav-content,
        #question-nav .nav-wrapper {
            height: 100%
        }

        #question-nav .nav-content.relative-z .add-button {
            position: absolute;
            bottom: 0;
            width: 100%;
            box-sizing: border-box
        }

        #question-nav .nav-content.relative-z .nav-Container {
            margin-top: -57px;
            padding-top: 57px
        }

        #question-nav .nav-content.inPaper .nav-Container {
            margin-top: -36px;
            padding-top: 36px
        }

        #question-nav .nav-Container {
            position: absolute;
            height: 100%;
            margin-top: -129px;
            padding-top: 129px;
            box-sizing: border-box;
            z-index: -1;
            width: 100%
        }

        #question-nav .paper-editor .label-field {
            margin-top: -10px
        }

        #question-nav .input-field {
            margin-top: 5px
        }

        @media screen and (max-width:1440px) {
            .left-area .add-btn {
                width: 146px
            }
            .left-area .question-tabs {
                width: 297px
            }
            .left-area .score {
                padding: 0 5px
            }
            .left-area .questions {
                width: 332px
            }
            .left-area .no-answer-question a,
            .left-area .question a {
                display: inline-block;
                height: 60px;
                overflow: hidden
            }
            .left-area .no-answer-question a {
                height: 55px;
                line-height: 1.3em
            }
            .left-area .edit-area-scroll {
                padding-left: 186px;
                padding-right: 200px
            }
        }

        @media screen and (max-width:1100px) {
            .left-area .add-btn {
                width: 106px
            }
            .left-area .question-tabs {
                width: 216px
            }
            .left-area .score {
                padding: 0 5px
            }
            .left-area .questions {
                width: 252px
            }
            .left-area .no-answer-question a,
            .left-area .question a {
                display: inline-block;
                height: 60px;
                overflow: hidden
            }
            .left-area .no-answer-question a {
                height: 55px;
                line-height: 1.3em
            }
            .left-area .edit-area-scroll {
                padding-left: 186px;
                padding-right: 200px
            }
        }

        .paper-data {
            background: #fff;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -o-border-radius: 4px;
            border-radius: 4px;
            padding: 30px
        }

        .paper-data .paper-head {
            position: relative
        }

        .paper-data .paper-head .buttons {
            position: absolute;
            top: 0;
            right: 10px
        }

        .paper-data .paper-head .export {
            background-image: url(../images/export.png);
            background-repeat: no-repeat;
            background-position: center left;
            color: #48D1AE;
            margin-left: 25px;
            padding-left: 13px
        }

        .paper-data .paper-head .count-time {
            font-size: 14px;
            padding-left: 90px;
            color: #117A5F
        }

        .paper-data .paper-head .edit {
            display: inline-block;
            width: 42px;
            height: 18px;
            line-height: 18px;
            cursor: pointer;
            background: url(../images/course-edit.png) left center no-repeat;
            position: absolute;
            top: 4px;
            margin-left: 25px;
            padding-left: 20px;
            font-size: 16px;
            color: #48D1AE
        }

        .paper-data .paper-nav {
            display: inline-block;
            box-sizing: border-box;
            width: 20%;
            max-height: 600px;
            padding: 0 15px 15px 0;
            float: left;
            overflow: auto;
            color: #666
        }

        .paper-data .paper-nav .title span {
            float: right;
            color: #48D1AE
        }

        .paper-data .paper-nav li {
            position: relative;
            width: 100%;
            cursor: pointer;
            margin-top: 10px;
            padding-right: 16px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap
        }

        .paper-data .paper-nav li:hover {
            color: #999
        }

        .paper-data .paper-nav li:hover .icon {
            display: block
        }

        .paper-data .paper-nav li .icon {
            display: none;
            position: absolute;
            top: 3px;
            right: 0;
            width: 16px;
            height: 16px;
            z-index: 10000
        }

        .paper-data .paper-nav li .icon:hover+.courseware-status::after,
        .paper-data .paper-nav li .icon:hover+.play-courseware::after,
        .paper-data .paper-nav li .icon:hover+.tip {
            display: block
        }

        .paper-data .paper-nav li .icon-delete {
            background: url(../images/delete-paper.png)
        }

        .paper-data .paper-nav li .icon-up {
            right: 18px;
            background: url(../images/up-arrow.png)
        }

        .paper-data .paper-nav li .courseware-status::after,
        .paper-data .paper-nav li .play-courseware::after,
        .paper-data .paper-nav li .tip {
            display: none;
            position: absolute;
            top: 0;
            color: #fff;
            font-size: 12px;
            padding: 2px 5px;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -o-border-radius: 4px;
            border-radius: 4px;
            background: rgba(0, 0, 0, .8);
            z-index: 10001
        }

        .paper-data .paper-nav li .tip-delete {
            right: 18px
        }

        .paper-data .paper-nav li .tip-up {
            right: 36px
        }

        .paper-data .paper-nav .actived,
        .paper-data .paper-nav .actived:hover {
            color: #48D1AE
        }

        .paper-data .score-info .student-item {
            width: 125px;
            display: inline-block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            color: #666
        }

        .paper-data .paper-question-wrap {
            display: inline-block;
            box-sizing: border-box;
            width: 78%;
            padding: 0 0 0 15px
        }

        .paper-data .paper-question-wrap .question-wrap {
            padding: 0
        }

        .subject-data {
            background: #fff;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -o-border-radius: 4px;
            border-radius: 4px;
            padding: 30px
        }

        .subject-data .question-wrap {
            padding: 0
        }

        .subject-data .question-wrap .buttons {
            position: absolute;
            top: 0;
            right: 10px;
            border: none
        }

        .subject-data .question-wrap .edit {
            display: inline-block;
            width: 42px;
            height: 18px;
            line-height: 18px;
            cursor: pointer;
            background: url(../images/course-edit.png) left center no-repeat;
            position: absolute;
            top: 4px;
            margin-left: 25px;
            padding-left: 20px;
            font-size: 16px;
            color: #48D1AE
        }

        #change_password .dialog-title,
        #change_password .header {
            font-size: 18px
        }

        #change_password {
            display: none;
            box-sizing: content-box;
            padding: 20px 8px 20px 20px;
            width: 280px;
            height: 342px;
            background-color: #fff;
            -webkit-box-shadow: 0 0 4px rgba(0, 0, 0, .3);
            -moz-box-shadow: 0 0 4px rgba(0, 0, 0, .3);
            -o-box-shadow: 0 0 4px rgba(0, 0, 0, .3);
            box-shadow: 0 0 4px rgba(0, 0, 0, .3);
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -o-border-radius: 4px;
            border-radius: 4px;
            color: #666
        }

        #change_password .dialog-close {
            display: inline-block;
            float: right
        }

        #change_password .dialog-icon-close {
            background-image: url(../images/cancel.png);
            width: 18.4px;
            height: 18.4px;
            background-size: 100%
        }

        #change_password .dialog-left {
            width: 300px
        }

        #change_password form {
            margin-top: 25px;
            font-size: 14px
        }

        #change_password form div div {
            margin-top: 2px
        }

        #change_password form .text-input {
            width: 264px;
            height: 38px;
            border: 1px solid #cbcbcb;
            font-size: 16px;
            padding: 5px;
            box-sizing: border-box
        }

        #change_password form .submit-btn {
            width: 264px;
            line-height: 40px;
            background-color: #48D1AE;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -o-border-radius: 4px;
            border-radius: 4px;
            border: none;
            color: #fff;
            font-size: 16px;
            cursor: pointer
        }

        #change_password form .submit {
            width: 264px;
            text-align: center;
            margin-top: 10px
        }

        #change_password form .mt-14,
        .line-short {
            margin-top: 14px
        }

        #change_password .courseware-status::after,
        #change_password .play-courseware::after,
        #change_password .tip {
            font-size: 12px;
            color: #D0021B;
            height: 16px;
            display: inline-block;
            width: 200px
        }

        .dialog-mock,
        .question-wrap .hidden {
            display: none
        }

        .line-short {
            width: 54px;
            height: 4px;
            background-color: #48D1AE
        }

        .success_tip {
            margin-top: 45px;
            text-align: center;
            width: 280px
        }

        .dialog-mock {
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, .4);
            position: absolute;
            top: 0
        }

        .tip-correct {
            background-image: url(../images/tip_correct.png)
        }

        .tip-wrong {
            background-image: url(../images/tip_wrong.png)
        }

        .hint {
            width: 20px;
            height: 20px;
            background-size: 100%;
            margin-left: 4px
        }

        .question-wrap {
            font-size: 14px;
            padding: 15px 15px 0;
            position: relative;
            margin: 0;
            z-index: 100
        }

        .question-wrap .question-content .green-badge {
            background-color: #53d4b3;
            border: 1px solid #4cbea1
        }

        .question-wrap .question-content .blue-badge {
            background-color: #00ccde;
            border: 1px solid #0d97a1
        }

        .question-wrap .question-content .yellow-badge {
            background-color: #f5a623;
            border: 1px solid #c59017
        }

        .question-wrap .question-content .grey-badge {
            background-color: #9b9b9b;
            border: 1px solid #888
        }

        .question-wrap .question-content .purple-badge {
            background-color: #9013fe;
            border: 1px solid #4200ea
        }

        .question-wrap .question-content .red-badge {
            background-color: #e64340;
            border: 1px solid #a92220
        }

        .question-wrap .count-time {
            font-size: 14px;
            padding-left: 90px;
            color: #117A5F
        }

        .question-wrap .open-state {
            color: #fff;
            position: absolute;
            top: 0;
            right: 40px;
            padding: 10px;
            cursor: default
        }

        .question-wrap .time-leave,
        .question-wrap .time-leave-up {
            position: relative;
            padding: 0 10px;
            cursor: pointer;
            -webkit-transition: all .4s ease;
            -moz-transition: all .4s ease;
            -o-transition: all .4s ease;
            transition: all .4s ease
        }

        .question-wrap .time-leave .btn-unfold .icon-triangle-down,
        .question-wrap .time-leave-up .btn-unfold .icon-triangle-down {
            display: inline-block
        }

        .question-wrap .time-leave .btn-unfold .icon-triangle-up,
        .question-wrap .time-leave-up .btn-unfold .icon-triangle-down,
        .question-wrap .time-leave-up .btn-unfold .icon-triangle-up {
            display: none
        }

        .question-wrap .time-leave-up:hover,
        .question-wrap .time-leave:hover {
            background: rgba(0, 150, 136, .3)
        }

        .question-wrap .time-leave-up:hover .btn-unfold,
        .question-wrap .time-leave:hover .btn-unfold {
            bottom: 0;
            opacity: 1;
            filter: alpha(opacity=100)
        }

        .question-wrap .time-leave-up:hover .btn-unfold .courseware-status::after,
        .question-wrap .time-leave-up:hover .btn-unfold .play-courseware::after,
        .question-wrap .time-leave-up:hover .btn-unfold .tip,
        .question-wrap .time-leave:hover .btn-unfold .courseware-status::after,
        .question-wrap .time-leave:hover .btn-unfold .play-courseware::after,
        .question-wrap .time-leave:hover .btn-unfold .tip {
            top: 20px;
            opacity: 1;
            filter: alpha(opacity=100)
        }

        .question-wrap .time-leave-up .btn-unfold .icon-triangle-up {
            display: inline-block
        }

        .question-wrap .btn-unfold {
            width: 40px;
            height: 15px;
            position: absolute;
            bottom: 5px;
            padding: 0;
            overflow: visible;
            opacity: 0;
            filter: alpha(opacity=0);
            -webkit-border-radius: 3px 3px 0 0;
            -moz-border-radius: 3px 3px 0 0;
            -o-border-radius: 3px 3px 0 0;
            border-radius: 3px 3px 0 0;
            left: 50%;
            margin-left: -20px
        }

        .question-wrap .icon-triangle-down,
        .question-wrap .icon-triangle-up {
            width: 0;
            height: 0;
            border-left: 6px solid transparent;
            border-right: 6px solid transparent
        }

        .question-wrap .icon-triangle-down {
            margin-top: -12px;
            border-top: 6px solid #fff;
            border-bottom: 6px solid transparent
        }

        .question-wrap .icon-triangle-up {
            margin-top: -28px;
            border-top: 6px solid transparent;
            border-bottom: 6px solid #fff
        }

        .question-wrap .question-cont {
            margin-bottom: 20px;
            line-height: 1.5
        }

        .question-wrap .question-cont img {
            margin-top: 10px;
            margin-bottom: 10px;
            vertical-align: top;
            max-width: 100%
        }

        .question-wrap .question-cont .link {
            margin: 0 .3em;
            color: #5bc0de
        }

        .question-wrap .question-cont .question-type {
            line-height: 20px;
            padding: 6px;
            border-radius: 2px;
            border-color: #888
        }

        .question-wrap .question-cont .item-tag {
            margin: 5px;
            padding: 6px;
            background: #4DB553;
            border-radius: 9px;
            font-size: 12px;
            color: #FFF;
            line-height: 12px
        }

        .question-wrap .question-cont .icon-paper {
            width: 12px;
            height: 14px;
            background: url(../images/h5/paper-num.png) no-repeat;
            background-size: 100%
        }

        .question-wrap .question-cont .icon-timer {
            width: 14px;
            height: 14px;
            background: url(../images/h5/paper-time.png) no-repeat;
            background-size: 100%
        }

        .question-wrap .answer-cont .answer-choice {
            margin-right: 40px;
            padding-bottom: 10px;
            float: left
        }

        .question-wrap .answer-cont .answer-choice span {
            vertical-align: top
        }

        .question-wrap .answer-cont .answer-choice img {
            max-width: 130px
        }

        .question-wrap .answer-cont .choice-short {
            float: left
        }

        .question-wrap .answer-cont .choice-medium {
            display: inline-block;
            vertical-align: top;
            min-height: 20px
        }

        .question-wrap .answer-cont .telecontrol {
            position: absolute;
            top: 15px;
            right: 15px
        }

        .question-wrap .edit {
            display: inline-block;
            cursor: pointer
        }

        .question-wrap .btn-edit {
            padding: 0 10px;
            background-repeat: no-repeat;
            background-position: 5px center;
            text-indent: 16px
        }

        .question-wrap .btn-edit:hover {
            background-color: #eee;
            text-decoration: underline
        }

        .question-wrap .btn-edit-question {
            background-image: url(../images/edit-question.png)
        }

        .question-wrap .btn-copy-question {
            background-image: url(../images/edit-copy.png)
        }

        .question-wrap .btn-del-question {
            background-image: url(../images/edit-del.png)
        }

        .question-wrap .buttons {
            margin: 0 -15px;
            padding: 0 15px;
            line-height: 50px;
            border-top: 1px solid rgba(0, 0, 0, .12)
        }

        .question-wrap .buttons .material-icons {
            width: 24px
        }

        .question-wrap .buttons .timing-open-info {
            min-width: 100px;
            margin-right: 20px
        }

        .question-wrap .buttons .time-limit-info {
            min-width: 85px
        }

        .question-wrap .buttons .stop-time {
            cursor: pointer;
            text-decoration: underline
        }

        .question-wrap .buttons .card-content {
            padding: 0 15px
        }

        .question-wrap .buttons .underline {
            display: inline-block;
            padding: 0 6px;
            line-height: normal;
            border-bottom: 1px solid teal
        }

        .question-wrap .buttons .date-card,
        .question-wrap .buttons .time-card {
            display: none;
            position: absolute;
            top: 50px;
            left: 50%;
            width: 320px;
            margin-left: -160px;
            -webkit-transition: all .4s ease;
            -moz-transition: all .4s ease;
            -o-transition: all .4s ease;
            transition: all .4s ease
        }

        .question-wrap .buttons .date-card .card,
        .question-wrap .buttons .time-card .card {
            margin: 0
        }

        .question-wrap .buttons .date-card .card-action,
        .question-wrap .buttons .time-card .card-action {
            padding: 0
        }

        .question-wrap .buttons .time-limit,
        .question-wrap .buttons .time-opening {
            position: relative;
            cursor: pointer
        }

        .question-wrap .buttons .btn-time-limit {
            padding-left: 24px;
            margin-bottom: -4px;
            vertical-align: middle
        }

        .question-wrap .buttons .time-card .input-time {
            display: inline-block;
            width: 75%;
            font-size: 18px;
            border-color: #fff
        }

        .question-wrap .buttons .date-card .datepicker {
            width: 55%;
            margin-right: 20px;
            vertical-align: bottom;
            border-color: #fff
        }

        .question-wrap .buttons .date-card .select-wrapper {
            width: 35%;
            display: inline-block
        }

        .question-wrap .buttons .date-card .validate {
            width: 40px;
            text-align: center;
            color: #fff;
            border-bottom: 1px solid #fff;
            box-shadow: none
        }

        .question-wrap .buttons .date-card .time-select .select-dropdown {
            max-height: 400px;
            display: inline-block;
            color: #fff;
            border-color: #fff
        }

        .question-wrap .buttons .date-card .time-select .caret {
            top: 0;
            color: #fff
        }

        .question-wrap .image-area {
            margin-top: 10px;
            font-size: 0
        }

        .question-wrap .image-area img {
            width: 25%;
            height: 225px
        }

        .icon-close-timing {
            margin-left: 6px;
            width: 10px;
            height: 10px;
            background: url(../images/message_delete.png);
            background-size: 100%
        }

        .courseware-status::after,
        .play-courseware::after,
        .tip {
            position: absolute;
            top: 10px;
            left: 50%;
            line-height: 22px;
            margin-left: -70px;
            width: 140px;
            color: #fff;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -o-border-radius: 4px;
            border-radius: 4px;
            background: #333;
            z-index: 1000;
            opacity: 0;
            filter: alpha(opacity=0);
            -webkit-transition: all .4s ease;
            -moz-transition: all .4s ease;
            -o-transition: all .4s ease;
            transition: all .4s ease
        }

        .courseware-status,
        .play-courseware {
            position: static;
            overflow: visible
        }

        #counter,
        .bubble,
        .clock-container,
        .wave {
            position: absolute
        }

        .courseware-status::after,
        .play-courseware::after {
            content: '在浏览器中直接打开本课件';
            top: -25px;
            z-index: 10001;
            width: 200px;
            margin-left: -100px
        }

        .courseware-status:hover::after,
        .play-courseware:hover::after {
            opacity: 1
        }

        .courseware-status::after {
            content: '开启课件后，学生可通过手机端直接查看本课件。';
            top: -47px;
            width: 180px;
            margin-left: -90px
        }

        #counter {
            left: 50%;
            margin-top: 150px;
            margin-left: -250px;
            font-family: GillSans, Calibri, Trebuchet, sans-serif;
            font-size: 180px;
            color: #fff;
            text-shadow: 0 4px 4px #a6a6a6;
            z-index: 100000
        }

        .counter_item {
            overflow: hidden;
            text-align: center;
            float: left
        }

        .counter_item .digit {
            width: 100px;
            height: 180px;
            overflow: hidden
        }

        .clock-container {
            top: -100px;
            left: 50%;
            margin-left: -45%;
            margin-bottom: 30px;
            width: 90%;
            height: 500px;
            overflow: hidden;
            background-color: #fff;
            opacity: 0;
            filter: alpha(opacity=0);
            -webkit-border-radius: 0 0 4px 4px;
            -moz-border-radius: 0 0 4px 4px;
            -o-border-radius: 0 0 4px 4px;
            border-radius: 0 0 4px 4px
        }

        .clock-container:hover .btn-fold {
            bottom: 0;
            opacity: 1;
            filter: alpha(opacity=100)
        }

        .clock-container .btn-fold {
            position: absolute;
            bottom: -10px;
            left: 50%;
            width: 40px;
            height: 15px;
            padding: 0;
            overflow: visible;
            -webkit-border-radius: 3px 3px 0 0;
            -moz-border-radius: 3px 3px 0 0;
            -o-border-radius: 3px 3px 0 0;
            border-radius: 3px 3px 0 0;
            opacity: 0;
            filter: alpha(opacity=0);
            margin-left: -20px
        }

        .clock-container .btn-fold:hover .courseware-status::after,
        .clock-container .btn-fold:hover .play-courseware::after,
        .clock-container .btn-fold:hover .tip {
            top: -30px;
            opacity: 1;
            filter: alpha(opacity=100)
        }

        .clock-container .icon-triangle-up {
            margin-top: -28px;
            width: 0;
            height: 0;
            border-top: 6px solid transparent;
            border-bottom: 6px solid #fff;
            border-left: 6px solid transparent;
            border-right: 6px solid transparent
        }

        .wave {
            bottom: 0;
            width: 2000px
        }

        .show .wave {
            will-change: transform
        }

        .hidden .wave {
            will-change: auto
        }

        .wave1 {
            background: url(../images/answer_data/wave1.png) no-repeat;
            height: 420px;
            -webkit-animation: wave1 30s linear infinite;
            -moz-animation: wave1 30s linear infinite;
            -o-animation: wave1 30s linear infinite;
            animation: wave1 30s linear infinite
        }

        .wave2 {
            background: url(../images/answer_data/wave2.png) no-repeat;
            height: 436px;
            -webkit-animation: wave2 30s linear infinite;
            -moz-animation: wave2 30s linear infinite;
            -o-animation: wave2 30s linear infinite;
            animation: wave2 30s linear infinite
        }

        .wave3 {
            background: url(../images/answer_data/wave3.png) no-repeat;
            height: 454px;
            -webkit-animation: wave3 30s linear infinite;
            -moz-animation: wave3 30s linear infinite;
            -o-animation: wave3 30s linear infinite;
            animation: wave3 30s linear infinite
        }

        .wave4 {
            background: url(../images/answer_data/wave4.png) no-repeat;
            height: 450px;
            -webkit-animation: wave4 30s linear infinite;
            -moz-animation: wave4 30s linear infinite;
            -o-animation: wave4 30s linear infinite;
            animation: wave4 30s linear infinite
        }

        .bubble {
            bottom: -160px;
            background: url(../images/answer_data/bubble.png) no-repeat;
            height: 400px;
            width: 100%
        }

        @-webkit-keyframes wave1 {
            0%,
            100% {
                -webkit-transform: translate(0, 0);
                -moz-transform: translate(0, 0);
                -o-transform: translate(0, 0);
                transform: translate(0, 0)
            }
            50% {
                -webkit-transform: translate(-800px, 0);
                -moz-transform: translate(-800px, 0);
                -o-transform: translate(-800px, 0);
                transform: translate(-800px, 0)
            }
        }

        @-moz-keyframes wave1 {
            0%,
            100% {
                -webkit-transform: translate(0, 0);
                -moz-transform: translate(0, 0);
                -o-transform: translate(0, 0);
                transform: translate(0, 0)
            }
            50% {
                -webkit-transform: translate(-800px, 0);
                -moz-transform: translate(-800px, 0);
                -o-transform: translate(-800px, 0);
                transform: translate(-800px, 0)
            }
        }

        @-o-keyframes wave1 {
            0%,
            100% {
                -webkit-transform: translate(0, 0);
                -moz-transform: translate(0, 0);
                -o-transform: translate(0, 0);
                transform: translate(0, 0)
            }
            50% {
                -webkit-transform: translate(-800px, 0);
                -moz-transform: translate(-800px, 0);
                -o-transform: translate(-800px, 0);
                transform: translate(-800px, 0)
            }
        }

        @keyframes wave1 {
            0%,
            100% {
                -webkit-transform: translate(0, 0);
                -moz-transform: translate(0, 0);
                -o-transform: translate(0, 0);
                transform: translate(0, 0)
            }
            50% {
                -webkit-transform: translate(-800px, 0);
                -moz-transform: translate(-800px, 0);
                -o-transform: translate(-800px, 0);
                transform: translate(-800px, 0)
            }
        }

        @-webkit-keyframes wave2 {
            0%,
            100% {
                -webkit-transform: translate(-800px, 0);
                -moz-transform: translate(-800px, 0);
                -o-transform: translate(-800px, 0);
                transform: translate(-800px, 0)
            }
            50% {
                -webkit-transform: translate(0, 0);
                -moz-transform: translate(0, 0);
                -o-transform: translate(0, 0);
                transform: translate(0, 0)
            }
        }

        @-moz-keyframes wave2 {
            0%,
            100% {
                -webkit-transform: translate(-800px, 0);
                -moz-transform: translate(-800px, 0);
                -o-transform: translate(-800px, 0);
                transform: translate(-800px, 0)
            }
            50% {
                -webkit-transform: translate(0, 0);
                -moz-transform: translate(0, 0);
                -o-transform: translate(0, 0);
                transform: translate(0, 0)
            }
        }

        @-o-keyframes wave2 {
            0%,
            100% {
                -webkit-transform: translate(-800px, 0);
                -moz-transform: translate(-800px, 0);
                -o-transform: translate(-800px, 0);
                transform: translate(-800px, 0)
            }
            50% {
                -webkit-transform: translate(0, 0);
                -moz-transform: translate(0, 0);
                -o-transform: translate(0, 0);
                transform: translate(0, 0)
            }
        }

        @keyframes wave2 {
            0%,
            100% {
                -webkit-transform: translate(-800px, 0);
                -moz-transform: translate(-800px, 0);
                -o-transform: translate(-800px, 0);
                transform: translate(-800px, 0)
            }
            50% {
                -webkit-transform: translate(0, 0);
                -moz-transform: translate(0, 0);
                -o-transform: translate(0, 0);
                transform: translate(0, 0)
            }
        }

        @-webkit-keyframes wave3 {
            0%,
            100%,
            50% {
                -webkit-transform: translate(-400px, 0);
                -moz-transform: translate(-400px, 0);
                -o-transform: translate(-400px, 0);
                transform: translate(-400px, 0)
            }
            25% {
                -webkit-transform: translate(0, 0);
                -moz-transform: translate(0, 0);
                -o-transform: translate(0, 0);
                transform: translate(0, 0)
            }
            75% {
                -webkit-transform: translate(-800px, 0);
                -moz-transform: translate(-800px, 0);
                -o-transform: translate(-800px, 0);
                transform: translate(-800px, 0)
            }
        }

        @-moz-keyframes wave3 {
            0%,
            100%,
            50% {
                -webkit-transform: translate(-400px, 0);
                -moz-transform: translate(-400px, 0);
                -o-transform: translate(-400px, 0);
                transform: translate(-400px, 0)
            }
            25% {
                -webkit-transform: translate(0, 0);
                -moz-transform: translate(0, 0);
                -o-transform: translate(0, 0);
                transform: translate(0, 0)
            }
            75% {
                -webkit-transform: translate(-800px, 0);
                -moz-transform: translate(-800px, 0);
                -o-transform: translate(-800px, 0);
                transform: translate(-800px, 0)
            }
        }

        @-o-keyframes wave3 {
            0%,
            100%,
            50% {
                -webkit-transform: translate(-400px, 0);
                -moz-transform: translate(-400px, 0);
                -o-transform: translate(-400px, 0);
                transform: translate(-400px, 0)
            }
            25% {
                -webkit-transform: translate(0, 0);
                -moz-transform: translate(0, 0);
                -o-transform: translate(0, 0);
                transform: translate(0, 0)
            }
            75% {
                -webkit-transform: translate(-800px, 0);
                -moz-transform: translate(-800px, 0);
                -o-transform: translate(-800px, 0);
                transform: translate(-800px, 0)
            }
        }

        @keyframes wave3 {
            0%,
            100%,
            50% {
                -webkit-transform: translate(-400px, 0);
                -moz-transform: translate(-400px, 0);
                -o-transform: translate(-400px, 0);
                transform: translate(-400px, 0)
            }
            25% {
                -webkit-transform: translate(0, 0);
                -moz-transform: translate(0, 0);
                -o-transform: translate(0, 0);
                transform: translate(0, 0)
            }
            75% {
                -webkit-transform: translate(-800px, 0);
                -moz-transform: translate(-800px, 0);
                -o-transform: translate(-800px, 0);
                transform: translate(-800px, 0)
            }
        }

        @-webkit-keyframes wave4 {
            0%,
            100%,
            50% {
                -webkit-transform: translate(-25%, 0);
                -moz-transform: translate(-25%, 0);
                -o-transform: translate(-25%, 0);
                transform: translate(-25%, 0)
            }
            25% {
                -webkit-transform: translate(-800px, 0);
                -moz-transform: translate(-800px, 0);
                -o-transform: translate(-800px, 0);
                transform: translate(-800px, 0)
            }
            75% {
                -webkit-transform: translate(0, 0);
                -moz-transform: translate(0, 0);
                -o-transform: translate(0, 0);
                transform: translate(0, 0)
            }
        }

        @-moz-keyframes wave4 {
            0%,
            100%,
            50% {
                -webkit-transform: translate(-25%, 0);
                -moz-transform: translate(-25%, 0);
                -o-transform: translate(-25%, 0);
                transform: translate(-25%, 0)
            }
            25% {
                -webkit-transform: translate(-800px, 0);
                -moz-transform: translate(-800px, 0);
                -o-transform: translate(-800px, 0);
                transform: translate(-800px, 0)
            }
            75% {
                -webkit-transform: translate(0, 0);
                -moz-transform: translate(0, 0);
                -o-transform: translate(0, 0);
                transform: translate(0, 0)
            }
        }

        @-o-keyframes wave4 {
            0%,
            100%,
            50% {
                -webkit-transform: translate(-25%, 0);
                -moz-transform: translate(-25%, 0);
                -o-transform: translate(-25%, 0);
                transform: translate(-25%, 0)
            }
            25% {
                -webkit-transform: translate(-800px, 0);
                -moz-transform: translate(-800px, 0);
                -o-transform: translate(-800px, 0);
                transform: translate(-800px, 0)
            }
            75% {
                -webkit-transform: translate(0, 0);
                -moz-transform: translate(0, 0);
                -o-transform: translate(0, 0);
                transform: translate(0, 0)
            }
        }

        @keyframes wave4 {
            0%,
            100%,
            50% {
                -webkit-transform: translate(-25%, 0);
                -moz-transform: translate(-25%, 0);
                -o-transform: translate(-25%, 0);
                transform: translate(-25%, 0)
            }
            25% {
                -webkit-transform: translate(-800px, 0);
                -moz-transform: translate(-800px, 0);
                -o-transform: translate(-800px, 0);
                transform: translate(-800px, 0)
            }
            75% {
                -webkit-transform: translate(0, 0);
                -moz-transform: translate(0, 0);
                -o-transform: translate(0, 0);
                transform: translate(0, 0)
            }
        }

        .reveal {
            display: none
        }

        .reveal-control {
            position: fixed;
            top: 20px;
            right: 20px;
            width: 36px;
            height: 36px;
            background: url(../images/unable.png);
            background-size: cover;
            z-index: 1000000
        }

        .playbtn-group .bottom,
        .playbtn-group .top {
            position: absolute;
            left: 50%;
            display: none;
            text-align: center;
            font-size: 12px;
            cursor: pointer;
            width: 80px;
            margin-left: -40px
        }

        .playbtn-group,
        .playbtn-group .center {
            width: 60px;
            height: 60px;
            background: #e64340;
            border-radius: 50%;
            display: flex
        }

        .playbtn-group .bottom p,
        .playbtn-group .top p {
            line-height: 1.5
        }

        .playbtn-group {
            position: fixed;
            bottom: 70px;
            right: 130px;
            margin-left: -30px;
            align-items: center;
            justify-content: center;
            box-shadow: 0 5px 27px 0 rgba(0, 0, 0, .16), 0 5px 13px 0 rgba(0, 0, 0, .26);
            color: #fff;
            z-index: 100000;
            -webkit-transition: all .3s ease;
            -moz-transition: all .3s ease;
            -o-transition: all .3s ease;
            transition: all .3s ease
        }

        .playbtn-group .center {
            position: relative;
            align-items: center;
            justify-content: center;
            -webkit-transition: all .3s ease;
            -moz-transition: all .3s ease;
            -o-transition: all .3s ease;
            transition: all .3s ease;
            z-index: 100
        }

        .content .right-area,
        .content .right-area .answer-distribute a {
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -o-border-radius: 4px
        }

        .playbtn-group .center .icon-cancle {
            display: none
        }

        .playbtn-group .top {
            top: 8px;
            z-index: 99
        }

        .playbtn-group .bottom {
            bottom: 5px;
            z-index: 99
        }

        .playbtn-group:hover {
            width: 160px;
            height: 160px;
            bottom: 20px;
            right: 80px
        }

        .playbtn-group:hover .center {
            background: #932a28
        }

        .playbtn-group:hover .center .icon-cancle {
            display: inline-block
        }

        .playbtn-group:hover .center .icon-replay {
            display: none
        }

        .playbtn-group:hover .bottom,
        .playbtn-group:hover .top {
            display: block
        }

        .hidden {
            display: none
        }

        .icon {
            display: inline-block
        }

        .icon-replay {
            width: 32px;
            height: 32px;
            background: url(../images/play.png);
            background-size: cover
        }

        .icon-play,
        .icon-stop {
            width: 24px;
            height: 24px
        }

        .icon-play {
            background: url(../images/play.png);
            background-size: cover
        }

        .icon-stop {
            background: url(../images/stop.png);
            background-size: cover
        }

        .icon-cancle {
            width: 32px;
            height: 32px;
            background: url(../images/cancle-w.png);
            background-size: cover;
            cursor: pointer
        }

        .black_background,
        body {
            background-color: #4A4A4A
        }

        body {
            font-family: "微软雅黑", "Microsoft YaHei", Roboto, Arial
        }

        .content .right-area {
            min-height: 640px;
            border-radius: 4px;
            margin: 30px 30px 30px 30px;
            position: relative;
            padding: 20px;
            background-color: #fff
        }

        .content .right-area ::-webkit-scrollbar {
            width: 10px;
            height: 10px
        }

        .content .right-area ::-webkit-scrollbar-track {
            background-color: #fff
        }

        .content .right-area ::-webkit-scrollbar-thumb {
            background-color: #dedede;
            border-radius: 100px
        }

        .content .right-area ::-webkit-scrollbar-button {
            display: none
        }

        .content .right-area ::-webkit-scrollbar-corner {
            background-color: #fff
        }

        .content .right-area .group-chart-container {
            display: none;
            margin-top: 12px;
            width: 100%
        }

        .content .right-area.grouped .right-list-content {
            display: none
        }

        .content .right-area.grouped .group-chart-container {
            display: block
        }

        .content .right-area .answer-info.simple-info .right-list>.export,
        .content .right-area .answer-info.simple-info .right-list>.green-line,
        .content .right-area .answer-info.simple-info .right-list>.right-list-title,
        .content .right-area div.simple-info .answer-distribute,
        .content .right-area div.simple-info .right-list .btn-checkinfo {
            display: none
        }

        .content .right-area .image-wrapper {
            width: 100%;
            background-color: #fff;
            margin-bottom: 30px;
            text-align: center;
            line-height: 700px
        }

        .content .right-area .image-wrapper img {
            height: 550px;
            width: 800px
        }

        .content .right-area .answer-info {
            padding: 15px;
            height: 480px;
            overflow-y: auto;
            margin-bottom: 0
        }

        .content .right-area .answer-info.simple-info .right-list>.switch {
            margin-bottom: 30px
        }

        .content .right-area div.simple-info {
            position: absolute;
            right: -360px;
            width: 300px;
            height: 600px;
            top: 0
        }

        .content .right-area div.simple-info .right-list .top-list li {
            margin-top: 22px;
            width: 33.3333%;
            cursor: pointer
        }

        .content .right-area div.simple-info .right-list-title {
            font-size: 16px
        }

        .content .right-area div.simple-info .btn,
        .content .right-area div.simple-info .btn-arc {
            display: block;
            margin: 0 auto
        }

        .content .right-area div.simple-info .error-btn-show,
        .content .right-area div.simple-info .error-student-show {
            display: none
        }

        .content .right-area .right-list {
            margin-bottom: 40px
        }

        .content .right-area .right-list .switch {
            vertical-align: top;
            margin-left: 10px
        }

        .content .right-area .right-list .switch .lever {
            margin-top: -4px
        }

        .content .right-area .right-list .right-list-content {
            color: #999
        }

        .content .right-area .right-list .right-list-content .top-list {
            overflow: auto;
            list-style: none;
            color: #666;
            font-size: 14px
        }

        .content .right-area .right-list .right-list-content .top-list li {
            display: inline-block;
            width: 72px;
            margin: 20px 0 0;
            text-align: center;
            position: relative;
            vertical-align: top;
            cursor: pointer
        }

        .content .right-area .right-list .right-list-content .top-list li .avatar-wrap {
            margin: 0 auto
        }

        .content .right-area .right-list .right-list-content .top-list li:hover .name {
            color: #48D1AE
        }

        .content .right-area .right-list .right-list-content .top-list li:first-child .avatar-wrap:after,
        .content .right-area .right-list .right-list-content .top-list li:nth-child(2) .avatar-wrap:after,
        .content .right-area .right-list .right-list-content .top-list li:nth-child(3) .avatar-wrap:after {
            content: '';
            width: 24px;
            height: 18.9px;
            position: absolute;
            background-size: 100%;
            top: -22px;
            left: 0;
            right: 0;
            margin: 0 auto
        }

        .content .right-area .right-list .right-list-content .top-list li:first-child .avatar-wrap {
            border-color: #F5A623
        }

        .content .right-area .right-list .right-list-content .top-list li:first-child .avatar-wrap:after {
            background-image: url(../images/crown.png)
        }

        .content .right-area .right-list .right-list-content .top-list li:first-child:hover .name {
            color: #F5A623
        }

        .content .right-area .right-list .right-list-content .top-list li:nth-child(2) .avatar-wrap {
            border-color: #999
        }

        .content .right-area .right-list .right-list-content .top-list li:nth-child(3) .avatar-wrap,
        .content .right-area .right-list .right-list-content .top-list li:nth-child(4) .avatar-wrap,
        .content .right-area .right-list .right-list-content .top-list li:nth-child(5) .avatar-wrap {
            border-color: #48D1AE
        }

        .content .right-area .right-list .right-list-content .top-list li:nth-child(2) .avatar-wrap:after {
            background-image: url(../images/crown_grey.png)
        }

        .content .right-area .right-list .right-list-content .top-list li:nth-child(2):hover .name {
            color: #999
        }

        .content .right-area .right-list .right-list-content .top-list li:nth-child(3) .avatar-wrap:after {
            background-image: url(../images/crown_green.png)
        }

        .content .right-area .right-list .right-list-content .top-list .avatar-wrap {
            width: 50px;
            height: 50px;
            overflow: hidden;
            background: url(../images/default-avatar.png);
            background-size: 100%;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            -o-border-radius: 50%;
            border-radius: 50%;
            border: 3px solid #EDEDED
        }

        .content .right-area .right-list .right-list-content .top-list .avatar-wrap img {
            width: 50px;
            height: 50px
        }

        .content .right-area .right-list .right-list-content .top-list .name {
            width: 100%;
            font-size: 18px;
            color: #666;
            margin-top: 6px;
            display: inline-block;
            white-space: nowrap;
            overflow: hidden
        }

        .content .right-area .right-list .right-list-content .top-list .overdue {
            color: #a26b36
        }

        .content .right-area .right-list .right-list-content .long-line {
            border-top: 2px solid #9FE0CC;
            margin-top: 15px;
            margin-bottom: 20px;
            margin-right: 45px
        }

        .content .right-area .right-list .right-list-content .rest-list,
        .content .right-area .right-list .right-list-content .score-list {
            font-size: 20px
        }

        .content .right-area .right-list .right-list-content .rest-list .container,
        .content .right-area .right-list .right-list-content .score-list .container {
            cursor: pointer;
            margin-left: 5px;
            margin-bottom: 3px;
            height: 32px;
            display: inline-block;
            width: 90px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap
        }

        .content .right-area .right-list .right-list-content .rest-list .container .overdue,
        .content .right-area .right-list .right-list-content .score-list .container .overdue {
            color: #a26b36;
            font-size: 12px
        }

        .content .right-area .right-list .right-list-content .score-list span {
            width: 125px;
            cursor: pointer
        }

        .content .right-area .right-list .right-list-content .score-list span a {
            color: #666
        }

        .content .right-area .right-list .right-list-content .score-list span a:hover {
            color: #48D1AE
        }

        .content .right-area .answer-distribute {
            margin-bottom: 50px
        }

        .content .right-area .answer-distribute .answer-distribute-title {
            position: relative
        }

        .content .right-area .answer-distribute a {
            font-size: 16px;
            background-repeat: no-repeat;
            background-position: 38px center;
            display: inline-block;
            min-width: 50px;
            padding: 0 5px 0 3px;
            color: #009688;
            border-radius: 4px
        }

        .content .right-area .answer-distribute .fold {
            background-image: url(../images/arrowdown.png)
        }

        .content .right-area .answer-distribute .unfold {
            background-image: url(../images/arrowup.png)
        }

        .content .right-area h3 {
            display: inline-block;
            font-size: 20px;
            color: #666;
            font-weight: 400
        }

        .content .right-area .green-line {
            border-top: 4px solid #48D1AE;
            width: 54px;
            margin-top: 15px;
            margin-bottom: 28px
        }

        .content .error-list {
            margin-bottom: 10px
        }

        .content .error-info-wrap .error-student-list,
        .content .error-info-wrap .green-line,
        .content .error-info-wrap .student-score-list,
        .content .error-list .green-line,
        .content .score-info .error-student-list,
        .content .score-info .green-line,
        .content .score-info .student-score-list {
            margin-bottom: 15px
        }

        .content .error-list .error-item {
            width: 96%;
            line-height: 24px;
            word-break: break-all;
            padding: 8px;
            color: #666;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -o-border-radius: 4px;
            border-radius: 4px
        }

        .content .error-list .error-item:nth-child(2n) {
            background: #eee
        }

        .content .error-list .error-item .student-anwer-img {
            width: 60px;
            height: 60px;
            margin-right: 5px;
            cursor: pointer
        }

        .content .error-student-list li,
        .content .student-score-list li {
            margin-right: 15px;
            font-size: 14px;
            line-height: 32px;
            cursor: pointer;
            float: left
        }

        .content .error-list .error-item .student-anwer-img:hover {
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .16), 0 2px 10px 0 rgba(0, 0, 0, .12)
        }

        .content .error-list .noellipsis {
            white-space: normal
        }

        .content .student-score-list ul {
            overflow: hidden
        }

        .content .student-score-list li {
            position: relative;
            display: block;
            padding: 0 7px;
            border-radius: 4px;
            height: 32px;
            width: 125px
        }

        .content .student-score-list li span {
            display: inline-block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap
        }

        .content .student-score-list li .state-btn {
            position: absolute;
            top: 0;
            right: 3px;
            font-size: 14px;
            line-height: 32px;
            padding: 0;
            height: 32px;
            margin-left: 12px;
            color: #999;
            background-color: transparent;
            display: none;
            border: none;
            outline: 0;
            cursor: pointer
        }

        .content .student-score-list li:hover {
            background-color: #dedede
        }

        .content .student-score-list li:hover span {
            width: 50px
        }

        .content .student-score-list li:hover .state-btn {
            display: inline-block
        }

        .content .error-student-list {
            color: #333;
            font-size: 14px
        }

        .content .error-student-list .right-list-title span {
            font-size: 14px;
            margin-left: 10px
        }

        .content .error-student-list .right-list-title i {
            position: relative;
            top: 2px;
            left: -2px;
            display: inline-block;
            width: 14px;
            height: 14px;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            -o-border-radius: 3px;
            border-radius: 3px
        }

        .content .error-student-list .right-list-title .icon-black {
            background-color: #666
        }

        .content .error-student-list .right-list-title .icon-orange {
            background-color: #F5A623
        }

        .content .error-student-list .right-list-title .icon-green {
            background-color: #48D1AE
        }

        .content .error-student-list .color-black {
            color: #666
        }

        .content .error-student-list .color-orange {
            color: #F5A623
        }

        .content .error-student-list .color-green {
            color: #48D1AE
        }

        .content .error-student-list ul {
            overflow: hidden
        }

        .content .error-student-list li {
            position: relative;
            display: block;
            padding: 0 7px;
            border-radius: 4px;
            height: 32px;
            width: 105px
        }

        .content .error-student-list li span {
            display: inline-block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap
        }

        .content .error-student-list li .state-btn {
            position: absolute;
            top: 0;
            right: 3px;
            font-size: 14px;
            line-height: 32px;
            padding: 0;
            height: 32px;
            margin-left: 12px;
            color: #999;
            background-color: transparent;
            display: none;
            border: none;
            outline: 0;
            cursor: pointer
        }

        #chart,
        #chart li {
            position: relative
        }

        .content .error-student-list li:hover {
            background-color: #dedede
        }

        .content .error-student-list li:hover span {
            width: 50px
        }

        .content .error-student-list li:hover .state-btn {
            display: inline-block
        }

        .content .student-name-btn {
            display: inline-block;
            font-size: 12px;
            margin-left: 15px;
            vertical-align: 2px
        }

        .content .student-name-btn label {
            padding-left: 25px;
            line-height: 20px;
            font-size: 12px
        }

        .content .student-score .student-item {
            display: inline-block;
            min-width: 100px;
            line-height: 30px;
            color: #4a4a4a;
            cursor: pointer
        }

        .content .error-btn-hidden,
        .content .error-btn-show,
        .content .error-student-hidden,
        .content .error-student-show,
        .content .student-score-hidden,
        .content .student-score-show {
            width: 150px;
            line-height: 30px;
            color: #009688;
            border: none;
            outline: 0;
            cursor: pointer;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            -o-border-radius: 5px;
            border-radius: 5px;
            font-family: inherit;
            background-color: #fff
        }

        #chart li .horizon-line,
        #figure li .horizon-line {
            border-top: 1px solid #DEDEDE;
            display: inline-block
        }

        .content .error-btn-hidden,
        .content .error-student-hidden,
        .content .student-score-hidden {
            background-color: #fff
        }

        .content .error-student-hidden,
        .content .error-student-show {
            width: 200px
        }

        .content .btn-disabled {
            background-color: #CBCBCB
        }

        .content .error-info-wrap,
        .content .score-info {
            clear: left;
            margin-top: 20px
        }

        .close,
        .close_answer,
        .open,
        .open_answer,
        .open_shadow {
            width: 72px;
            height: 30px;
            line-height: 30px;
            font-size: 14px;
            text-align: center;
            color: #fff;
            cursor: pointer;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -o-border-radius: 4px;
            border-radius: 4px;
            float: left;
            margin-left: 10px;
            background-color: #CBCBCB
        }

        #chart li span.axis,
        #column li,
        #figure li span.axis {
            color: #666
        }

        .close,
        .close_answer,
        .open_shadow {
            background-color: #48D1AE
        }

        #chart li {
            margin-bottom: 14px
        }

        #chart li .horizon-line {
            width: 430px;
            position: absolute;
            top: 9px;
            left: 48px
        }

        #column {
            position: absolute;
            top: 63px;
            left: 37px
        }

        #column li {
            float: left;
            margin-right: 40px;
            position: absolute;
            bottom: -145px;
            text-align: center
        }

        #column li:first-child {
            margin-left: 60px
        }

        #column li span.choice-ratio {
            text-align: center
        }

        #column li .fill {
            width: 50px;
            height: 0
        }

        #column li:nth-child(8n+1) .fill {
            background-color: #19A3FD
        }

        #column li:nth-child(8n+2) .fill {
            background-color: #66D546
        }

        #column li:nth-child(8n+3) .fill {
            background-color: #FEB628
        }

        #column li:nth-child(8n+4) .fill {
            background-color: #cd397e
        }

        #column li:nth-child(8n+5) .fill {
            background-color: #5F5F5F
        }

        #column li:nth-child(8n+6) .fill {
            background-color: #2EAFFC
        }

        #column li:nth-child(8n+7) .fill {
            background-color: #79DB5B
        }

        #column li:nth-child(8n+8) .fill {
            background-color: #ae2f28
        }

        #figure {
            position: relative
        }

        #figure li {
            position: relative;
            margin-bottom: 25px
        }

        #figure li:last-child {
            margin-bottom: 0
        }

        #figure li .horizon-line {
            width: 450px;
            position: absolute;
            top: 9px;
            left: 48px
        }

        #lines {
            position: relative
        }

        #lines li {
            float: left
        }

        #lines li .score-point {
            position: absolute;
            left: 100px;
            top: -115px;
            display: inline-block;
            width: 10px;
            height: 10px;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            -o-border-radius: 50%;
            border-radius: 50%;
            background-color: #48D1AE
        }

        #lines li .score-point .score {
            display: none;
            width: 30px;
            height: 20px;
            line-height: 20px;
            background-color: #333;
            color: #fff;
            font-size: 12px;
            text-align: center;
            position: absolute;
            left: 11px;
            top: -5px
        }

        #lines li .score-point:hover .score {
            display: block
        }

        #lines li .score-line {
            position: absolute;
            left: 104px;
            top: -105px;
            display: inline-block;
            width: 2px;
            height: 94px;
            background-color: #48D1AE
        }

        #finish-tip,
        .answer-content {
            position: absolute;
            display: none
        }

        .answer-content {
            left: 0;
            right: 0;
            width: 95%;
            margin: 0 auto;
            padding: 16px;
            color: #4a4a4a;
            z-index: 10;
            background: #fff;
            box-shadow: 0 2px 10px 0 rgba(0, 0, 0, .16), 0 2px 5px 0 rgba(0, 0, 0, .26);
            -webkit-border-radius: 0 0 4px 4px;
            -moz-border-radius: 0 0 4px 4px;
            -o-border-radius: 0 0 4px 4px;
            border-radius: 0 0 4px 4px
        }

        #scores {
            margin-left: 50px;
            color: #666
        }

        #scores li {
            float: left;
            margin-left: 25px;
            width: 20px;
            text-align: center
        }

        #finish-tip {
            top: 300px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 100;
            color: #fff;
            padding: 28px;
            border: none;
            background-color: rgba(112, 112, 112, .8)
        }

        .export {
            display: inline-block;
            background-image: url(../images/export.png);
            background-repeat: no-repeat;
            text-indent: 14px;
            background-position: center left;
            color: #48D1AE;
            font-size: 14px;
            vertical-align: 3px;
            margin-left: 5px
        }

        .reveal.center .slides section {
            height: 100%
        }

        .to-discussion {
            margin: -15px 0 0 15px;
            font-weight: 700;
            text-decoration: underline;
            color: #48D1AE
        }
    </style>

    <!-- jQuery Library -->
    <script src="js/jquery-1.11.2.min.js"></script>

    <!--materialize js-->
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <script src="time/jquery.countdown.js"></script>

<script>
    window.jQuery(function($) {
        "use strict";

        $('time').countDown({
            with_separators : false
        });
        $('.alt-1').countDown({
            css_class : 'countdown-alt-1'
        });
        $('.alt-2').countDown({
            css_class : 'countdown-alt-2'
        });

    });
</script>
    <!--plugins.js - Some Specific JS codes for Plugin Settings-->
    <script type="text/javascript" src="js/plugins.js"></script>
    <!-- Toast Notification -->
    <style>
        .test_time{color:green; line-height:45px;}
        .test_time i{font-size:20px; height:45px; line-height:40px; display:block;}
        .test_time b{font-size:26px;text-align: center; height:45px; display:block;  margin-left:10px;}

    </style>



</body>

</html>
