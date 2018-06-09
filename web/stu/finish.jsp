<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: kwinter
  Date: 2018/3/17
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>练习完成</title>
    <link href="../tea/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection">

    <style>

        #modal1{
            background: #1d9dd7;
            width: 320px;
        }

    </style>
</head>

<body onload="showScores('ps')">
<div class="main">

    <div id="modal1" class="modal">
        <div class="modal-content">
            <h4>本次测验得分</h4>
            <h3 id="prescores">0</h3>
        </div>
        <div class="modal-footer">
            <a href="../home/home.jsp" class=" modal-action modal-close waves-effect waves-green btn-flat">确认</a>
        </div>
    </div>
</div>

<script src="jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../tea/js/materialize.min.js"></script>

<script>
    function showScores(name) {
        /*获取地址栏中的参数ps（本次测验成绩）*/
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        $("#prescores").text(unescape(r[2]))

        $("#modal1").openModal()
    }
</script>

</body>

</html>
