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
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
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
        min-height: 400px;
        max-height: 400px;
        height: 400px;
    }

</style>
<div class="xl">


     <div class="row">
         <div class="col-md-3" id="ulist">
             <div class="panel panel-default">
             <div class="panel-heading">讨论区成员</div>
         <div class="chatBox-list panel-body">

             <div class="chat-list-people">

                 <div class="chat-name">
                     <p>学习小组1</p>
                 </div>
                 <div class="message-num" style="display: none">0</div>
             </div>
             <div class="chat-list-people">

                 <div class="chat-name">
                     <p>课堂讨论区</p>
                 </div>
                 <div class="message-num" style="display: none">0</div>
             </div>

         </div>
             </div>
         </div>
    <div class="col-md-6">
        <div id="msgparent" class="panel panel-default">
            <div class="panel-heading">
                聊天  <input style="width:100px" type="hidden" class="form-control" placeholder="RID" id="receId" value="2"/>
            </div>
            <div class="panel-body" style="padding: 0px;">
                   <div class="chatBox-content">
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
<!-- /. FOOTER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="assets/js/bootstrap.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="assets/js/custom.js"></script>
<script src="js/jxv2.js"></script>



</body>
</html>

