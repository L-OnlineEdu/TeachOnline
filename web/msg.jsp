<%--
  Created by IntelliJ IDEA.
  User: kwinter
  Date: 2018/3/13
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table id="ta">
        <tr>
            <td>用户名：</td>
            <td>消息</td>
        </tr>
    </table>
    <form>
        要发送的消息:<input name="msg" id="sendMsg"/>
        接受者uid:<input name="receiveid" value="2" id="receId">
        <input type="button" value="发送" onclick="send()">

    </form>
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/jx.js"></script>
</body>
</html>
