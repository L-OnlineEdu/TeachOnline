<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>在线课堂</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="shortcut icon" type="image/x-icon" href="/assets/favicon.ico">
    <link rel="shortcut icon" type="image/png" href="/assets/favicon.png">
    <link href="../tea/css/discss.css" rel="stylesheet">

    <!-- CORE CSS-->
    <link href="../tea/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="../tea/css/style.css" type="text/css" rel="stylesheet" media="screen,projection">

    <link type="text/css" href="../tea/css/chat.css" rel="stylesheet">
    <link type="text/css" href="../alert/css/alert.css" rel="stylesheet">

</head>

<body>
<!-- Modal Structure -->

<div id="modal6" class="modal bottom-sheet">
    <div class="modal-content">
        <h4>练习试题</h4>
        <div id="quescont">

        </div>
        <div id="a">
            <input type="radio" id="sa" name="group6" value="A"/>
            <label for="sa" id="sa1"></label>
        </div>
        <div id="b">
            <input type="radio" id="sb" name="group6" value="B"/>
            <label for="sb" id="sa2"></label>
        </div>
        <div id="c">
            <input type="radio" id="sc" name="group6" value="C"/>
            <label for="sc" id="sa3"></label>
        </div>
        <div id="d">
            <input type="radio" id="sd" name="group6" value="D"/>
            <label for="sd" id="sa4"></label>
        </div>
        <div class="modal-footer">
            <a style="background-color: #68bee0;" onclick="submitAsw()" class=" modal-action modal-close waves-effect waves-green btn-flat">提交</a>
        </div>
    </div>
</div>


<!-- jQuery Library -->
<script src="../utils/js/jquery-1.11.2.min.js"></script>
<script src="../alert/js/alert.js"></script>
<%--me--%>
<script type="text/javascript" src="../tea/jxv4.js"></script>
<!--materialize js-->
<script type="text/javascript" src="../tea/js/materialize.min.js"></script>

<!--plugins.js - Some Specific JS codes for Plugin Settings-->
<script type="text/javascript" src="../tea/js/plugins.js"></script>
<link rel="stylesheet" type="text/css" href="../tea/swx/sweetalert.css">
<link type="text/css" href="/utils/alert/css/alert.css" rel="stylesheet">
<script src="../tea/swx/sweetalert-dev.js"></script>
<script src="/utils/alert/js/alert.js"></script>


<div class="pace  pace-inactive">
    <div class="pace-progress" data-progress-text="100%" data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
        <div class="pace-progress-inner"></div>
    </div>
    <div class="pace-activity"></div>
</div>

<style>
    body ul .dropdown-content{
        position: fixed;!important;
    }
</style>
<div data-reactroot="" style="flex: 1 1 0%; height: 100%;">
    <div class="page">
                <div class="bgColor">

            <div class="discussions" style="height: 100%;">
                <div class="discussionPanel">
                    <div class="discussionPanel" style="width: 270px;">

                        <div class="list" id="tablists">
                            <div class="discussionTitleCard" style="background-color: rgb(76, 190, 161);" id="tab0">
                                <div class="infoBox">
                                        <span style="font-size: 20px; margin-right: 4px;">我的课堂</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="teacherContent">
                    <%--<img src="../tea/img/stying.jpg" width="600px" height="440px" alt="">--%>
                </div>
                </div>
            </div>
    </div>
</div>

<script>

    function submitAsw() {
        answ = $('input[name="group6"]:checked').val()
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/stu/submitAsw" ,//url
            data: {"asw":answ},
            success: function (result) {

            }
        });
    }
    window.addEventListener('beforeunload', function(event) {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/stu/exitCour" ,//url
            data: {},
            success: function (result) {

            }
        });
    });
</script>

</body>

</html>
