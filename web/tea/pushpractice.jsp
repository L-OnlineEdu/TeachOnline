<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
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
    <link href="/utils/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="/utils/css/style.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link rel="stylesheet" href="/utils/slzy/jquery-ui.css">
 <%-- <link rel="stylesheet" href="/resources/demos/style.css">--%>
<style type="text/css">
 #trash { min-height: 18em; padding: 1%; }
  #trash h4 { line-height: 16px; margin: 0 0 0.4em; }
  #trash h4 .ui-icon { float: left; }
  #trash .gallery h5 { display: none; }
</style>

    <style>
        .foot{
            width:80%; height:50px; clear:both;
            background-color: #ffffff;
            position: fixed;
            bottom: 0;
        }
        #aCss{
            float: right;
            margin: 10px;
        }
    </style>
</head>

<body>
<div class="main-container">
    <div class="wrapper" style="color: rgba(0, 0, 0, 0.87); background-color: rgb(242, 242, 242); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 6px, rgba(0, 0, 0, 0.12) 0px 1px 4px; border-radius: 2px;">
        <div class="header" style="margin: 15px">

            <center><div class="panel-title">练习试卷</div></center>

        </div>

        <div id="thaom">

        </div>
        <hr style="margin: -1px 0px 20px 25px; height: 1px; border: none; background-color: rgb(224, 224, 224);">
            
            <!-- react-empty: 2482 -->
            <div id="trash" style="display:none" class="ui-widget-content ui-state-default"> 
			 <div class="row">
			    <form class="col s12">
			      <div class="row">
			         <div class="input-field col s6">
			          <input id="addPaperTitle" type="text" class="validate">
			          <label for="addPaperTitle">试卷题目</label>
			        </div>
			        <div class="input-field col s6">
			          <input id="addPaperTime" type="text" class="validate">
			          <label class="active" for="addPaperTime">考试时间</label>
			        </div>
			      </div>
			      <div class="row">
			        <div class="input-field col s12">
			         <textarea id="addContext" class="materialize-textarea"></textarea>
          			 <label class="active" for="addContext">试卷描述</label>
			        </div>
			      </div>
			    </form>
			  </div>
	 
	      <div style="margin-left: 16px;margin-bottom: 16px">题目ID</div>
	      <div id="addPaperQID"></div>
	      <Button class=" modal-action modal-close waves-effect waves-green btn-flat" id="addPaperTrue">确定</Button>
	      <a href="/tea/pushpaper.jsp" class=" modal-action modal-close waves-effect waves-red btn-flat">取消</a>

	   
	  
			</div>
        </div>
        
        <div  class="questions-wrapper" style="color: rgba(0, 0, 0, 0.87); background-color: rgb(255, 255, 255); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 6px, rgba(0, 0, 0, 0.12) 0px 1px 4px; border-radius: 2px;">
        <div>
            <div style="padding-bottom: 0px;"></div>
            <div class="" style="transform: translateZ(0px);">
                <div class="questions-wrapper-header">

                </div>
            </div>

        <div id ="qbox"></div>

    </div>

<!-- ================================================
Scripts
================================================ -->

<script id="questionx" type="text/html">
        <div id="questionId-%questionId%" name="questionId-%pid%" class="shineBoxWrapper drag sss">
        <div class="question-card-wapper">
            <div class="top-wapper">
                <div class="left-wapper">
                    <div class="questions-type-wapper" style="background-color: rgb(76, 190, 161);">
                        <div>
                            <div class="num-word">
                                        <span>
                                            <span>%pid%</span>
                                            <span class="spacing">-</span>
                                        </span>
                                <span>%thx%</span>
                            </div>
                            <div class="type-word">单选</div>
                        </div>
                    </div>

                    <div class="correct-rate-wapper"></div>
                </div>
                <div class="imgWrapper content-wapper">
                    <div class="questions-wapper">
                        <div class="question-head">
                            <p class="question-content">
                            <p>%title%</p>
                            </p>
                        </div>
                        <div class="questions-body">
                            <div class="radio-btn-wapper">
                                <div class="radio-btn">
                                    <div></div>
                                </div>
                                A. %a00%
                            </div>
                            <div class="radio-btn-wapper">
                                <div class="radio-btn">
                                    <div></div>
                                </div>
                                B. %a01%
                            </div>
                            <div class="radio-btn-wapper">
                                <div class="checked-radio-btn">
                                    <div></div>
                                </div>
                                C. %a02%
                            </div>
                            <div class="radio-btn-wapper">
                                <div class="radio-btn">
                                    <div></div>
                                </div>
                                D. %a03%
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </script>

<!-- jQuery Library -->
<script src="/utils/js/jquery-1.11.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="/utils/swx/sweetalert.css">
<script src="/utils/swx/sweetalert-dev.js"></script>
<!--materialize js-->
<script type="text/javascript" src="/utils/slzy/jquery-ui.js"></script>
<script type="text/javascript" src="/utils/js/materialize.min.js"></script>
<script type="text/javascript" src="paper.js"></script>



<!--  &lt;!&ndash;scrollbar&ndash;&gt;
<script type="text/javascript" src="js/perfect-scrollbar.min.js"></script>


&lt;!&ndash;plugins.js - Some Specific JS codes for Plugin Settings&ndash;&gt;
<script type="text/javascript" src="js/plugins.js"></script>
&lt;!&ndash; Toast Notification &ndash;&gt;
<script type="text/javascript">
// Toast Notification
</script>-->
<style>
    .selectx{
        background-color: white; box-shadow: rgba(188, 188, 188, 0.5) 0px 0px 4px 0px;
    }
    .question-card-wapper {
        position: relative;
        width: 100%;
        background-color: #fff;
        border-bottom: 1px solid #bbb;
        border-top: 1px solid #bbb;
        padding-bottom: 60px;
    }

    .question-card-wapper .top-wapper {
        width: 100%;
        display: flex;
        min-height: 180px;
    }

    .question-card-wapper .top-wapper .left-wapper {
        width: 64px;
        position: absolute;
        top: 0;
        left: 0;
    }

    .question-card-wapper .top-wapper .left-wapper .questions-type-wapper {
        width: 64px;
        height: 60px;
        color: #fff;
        text-align: center;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .question-card-wapper .top-wapper .left-wapper .questions-type-wapper .num-word {
        font-size: 16px;
        margin-bottom: 5px;
    }

    .question-card-wapper .top-wapper .left-wapper .questions-type-wapper .num-word .spacing {
        padding: 0 2px;
    }

    .question-card-wapper .top-wapper .left-wapper .questions-type-wapper .type-word {
        font-size: 12px;
        letter-spacing: 0.3px;
    }

    .question-card-wapper .top-wapper .left-wapper .difficulty-wapper {
        width: 64px;
        margin-top: 8px;
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        font-size: 12px;
        letter-spacing: 0.3px;
        color: #4a4a4a;
    }

    .question-card-wapper .top-wapper .left-wapper .difficulty-wapper .icon {
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 8px;
        margin-top: 5px;
    }

    .question-card-wapper .top-wapper .left-wapper .difficulty-wapper .icon i {
        font-size: 10px;
    }

    .question-card-wapper .top-wapper .left-wapper .correct-rate-wapper {
        width: 64px;
        height: 60px;
        text-align: center;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 12px;
        letter-spacing: 0.3px;
        color: #4a4a4a;
    }

    .question-card-wapper .top-wapper .left-wapper .correct-rate-wapper .num-word {
        margin-top: 5px;
    }

    .question-card-wapper .top-wapper .content-wapper {
        margin: 10px 15px 0 74px;
        width: 100%;
    }

    .question-card-wapper .tool-bar-wapper {
        position: absolute;
        bottom: 0;
        height: 56px;
        width: 100%;
    }

    .file-type-icon {
        margin-bottom: 8px;
        width: 40px;
    }

    .main-container {
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: flex-start;
        padding: 20px;
    }

    .questions-wrapper {
        flex: 1;

        overflow: hidden;
    }

    .questions-wrapper-header {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        height: 56px;
        background-color: #eee;
        border-bottom: 1px solid #d3d3d3;
        padding: 0 15px 0 5px;
        position: relative;
    }

    @keyframes shineBox {
        from {
            background-color: rgba(255, 244, 205, 0);
        }
        50% {
            background-color: rgba(255, 244, 205, 0.9);
        }
        to {
            background-color: rgba(255, 244, 205, 0);
        }
    }

    .question-wrapper-shine-box {
        position: absolute;
        width: 100%;
        height: 100%;
        animation-name: shineBox;
        animation-duration: 700ms;
        animation-iteration-count: 1;
        z-index: 1;
    }

    .shineBoxWrapper {
        position: relative;
    }

</style>

    <div class="foot">
        <div id="aCss">
            <a onclick="sendP()" class="waves-effect waves-light btn">
                <i class="mdi-content-send right"></i>
                确认推送
            </a>
        </div>
    </div>
        </div>
</div>
</body>
<script>
    function sendP() {
        swal({
                title: "练习",
                text: "输入本次练习时间",
                type: "input",
                showCancelButton: false,
                closeOnConfirm: false,
                animation: "slide-from-top",
                inputPlaceholder: "单位为分钟"
            },
            function(inputValue){
                if (inputValue === false) return false;

                if (inputValue === "") {
                    swal.showInputError("输入练习所需时间");
                    return false
                }

                $.ajax({
                    url:"/tea/pushpractice",
                    data:{'paperid':pushid,'practiceTime':inputValue},
                    success:function (data) {
                        console.info(data.msg)
                        if (data.msg=="success"){
                            swal("成功！", "测验已开启" ,"success");
                            window.location.href="/tea/practicePushed"
                        }else {
                            swal("失败！", "确认是否登录" ,"error");
                        }
                    }
                })
            });
    }
</script>
</html>