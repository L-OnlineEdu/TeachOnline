<%--
  Created by IntelliJ IDEA.
  User: kwinter
  Date: 2018/3/14
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>home</title>
    <link rel="stylesheet" type="text/css" href="msgv2/font_Icon/iconfont.css">
    <link rel="stylesheet" type="text/css" href="msgv2/css/chat.css">
    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!--CUSTOM BASIC STYLES-->
    <link href="assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
  <%--  <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />--%>
    <link href="js/jquery-ui.min.css" rel="stylesheet"/>
</head>
<body>


<style>
    body{
        background: #F3F3F3;
    }
    .xl{
        padding: 15px 15px;

        height: 100%;
        min-height: 400px;
    }
    #chatBox-content-demo{

        height:100%;
    }
    .my-return{
        color: grey;
        margin: 10px;
        float: left;
        width: 30px;
        height: 30px;
        line-height: 30 px;
        border-radius: 20px;
        cursor: pointer;
        text-align: center;
    }

    .my-return:hover{
        background: lightgray;
    }
</style>
<div class="xl">

    <input type="hidden" id="currentUserRole" value="${sessionScope.user.role}">
    <input type="hidden" id="currentUserId" value="${sessionScope.user.uid}">
     <div class="row">
         <div class="col-md-2" style="width: 300px; height: 600px">
             <div class="panel panel-default" style="width: 300px;">
                 <div class="my-return" onclick="returnx()">返回</div>
                 <div class="panel-heading" id="leftHead">选择讨论组</div>
                 <div class="chatBox-list panel-body" id="leftA">



                 </div>
             </div>
         </div>

         <div class="col-md-7" style="height: 600px;">

             <div id="msgparent" class="panel panel-default">
                 <div id="tabs">
                     <ul>
                         <li><a href="#msgparent">课堂讨论</a><span class="close glyphicon glyphicon-remove"></span></li>
                         <li><a href="#msgparent">课堂讨论</a><span class="close glyphicon glyphicon-remove"></span></li>
                     </ul>
                 </div>
                 <div class="panel-body" style="padding: 0px;height:440px;">
                     <div class="chatBox-content" style="height:100%">
                         <div class="chatBox-content-demo"  id="chatBox-content-demo">

                         </div>
                     </div>
                 </div>
                 <div class="panel-footer">
                     <div class="input-group">
                         <input type="text" class="form-control" placeholder="Enter Message" id="sendMsg"/>

                         <span class="input-group-btn">
                             <button class="btn btn-success" onclick="send()" type="button">SEND</button>
                         </span>

                     </div>
                 </div>

             </div>

         </div>

         </div>




    </div>



    <%--<!-- /. PAGE INNER  -->--%>
</div>
<%--<!-- /. PAGE WRAPPER  -->--%>

<!-- /. WRAPPER  -->
<textarea id="sendx" style="display:none">
      <div class="clearfloat">
            <div class="author-name">
                <small class="chat-date">%sendTime%</small>
            </div>
            <div class="right">
                <div class="chat-message">%msg%</div>
                <div class="chat-avatars">%sender%</div>
            </div>
    </div>
    </textarea>

<textarea id="recex" style="display:none">
          <div class="clearfloat">
            <div class="author-name">
                <small class="chat-date">%sendTime%</small>
            </div>
            <div class="left">
                <div class="chat-avatars">%sender.userName%</div>
                <div class="chat-message">
                    %message%
                </div>
            </div>
          </div>
</textarea>
<script id="leftAreaGList" type="text/html">
    <div class="chat-list-people" style="overflow: hidden" onclick="loadGmember(%gid%,'%gname%')">

        <div class="chat-name">
            <p>%gname%</p>
        </div>

        <div class="message-num" style="display: none">0</div>
    </div>

</script>
<script id="leftAreaClassDiss" type="text/html">
    <div class="chat-list-people" style="overflow: hidden" onclick="loadGmember(0,'课堂讨论区')">

        <div class="chat-name">
            <p>课堂讨论</p>
        </div>

        <div class="message-num" style="display:none">0</div>
    </div>

</script>

<script id="leftArea" type="text/html">
    <div class="chat-list-people" style="overflow: hidden" onclick="%func%">

        <div class="chat-name" style="width: 30px">
         <p>%userName%</p>
        </div>
        <div id="btng%uid%" class="btn-group btn-group-sm" role="group"  style="margin-top: 20px" aria-label="...">
           %buttons%
        </div>
        <div class="message-num" style="display: none">0</div>
        </div>

</script>
<script type="text/html" id="normalbtn">
    <button type="button" class="btn btn-default" onclick="sendMsgx(this)">发消息</button>
</script>
<script type="text/html" id="teabtns">
    <button type="button" class="btn btn-default" onclick="handsupx(this)">举手</button>
</script>
<script type="text/html" id="stubtns">
    <button type="button" class="btn btn-default" onclick="warnx(this)">警告</button>
    <button type="button" class="btn btn-default" onclick="askQx(this)">提问</button>
</script>
<!-- /. FOOTER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="assets/js/bootstrap.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<%--<script src="assets/js/custom.js"></script>--%>


<style>
    .close{
        padding-top: 6px;
        padding-right: 4px;
    }
</style>

<link rel="stylesheet" href="alert/css/alert.css">
<link rel="stylesheet" type="text/css" href="swx/sweetalert.css">
<script src='alert/js/alert.js'></script>
<script src="swx/sweetalert-dev.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jxv3.js"></script>


</body>
</html>

