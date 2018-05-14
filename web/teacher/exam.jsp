<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <!--Import Google Icon Font-->
    <%--<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">--%>
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>

<body>
<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="../js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="../js/materialize.min.js"></script>

<div class="row" style="position: fixed;top: 0px; z-index:99;width:100%;background: #ffffff">
    <label style="width:100%">选择试卷</label>
    <div class="input-field" style="width: 50%;float: left;">
        <select id="sl" onchange="jiexi()">
            <option value="" disabled selected>科目</option>

        </select>


    </div>

    <a class="waves-effect waves-light btn" onclick="sendx()" style="position: relative;top: 30px;float: right;"><i class="material-icons right">send</i>推送试卷</a>
</div>

<textarea style="display: none" id="quest">

         <div class="row">
        <div>
          <div class="card light">
            <div class="card-content">
              <span class="card-title">%thx%%title%</span>
                <p>%answers%</p>
            </div>

          </div>
        </div>
      </div>


    <%--<h5>%thx%%title%</h5>--%>
    <%--<p id="p%questionId%">--%>
        <%--%answers%--%>
    <%--</p>--%>
</textarea>
<div id="quesbox" style="position:absolute;top: 50px;overflow: auto">

</div>
<link type="text/css" rel="stylesheet" href="../window/window.css"/>
<script src="../window/window.js"></script>

<script src="teacherjs.js"></script>

<script type="text/html" id="tp">
    <div class="row">
        <div class="col s12">
            <div class="progress">
                <div class="indeterminate"></div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col s12" style="text-align: center">正在推送</div>
    </div>
</script>
</body>
</html>
