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

<style>
    .foot{
        width:100%; height:50px; clear:both;
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

<body onload="getAllQues()">

    <div id="allQues">

    </div>

    <div class="foot">
        <div id="aCss">
            <a onclick="sendQues()" class="waves-effect waves-light btn">
                <i class="mdi-content-send right"></i>
                确认发送
            </a>
        </div>
    </div>

    <!-- jQuery Library -->
    <script src="js/jquery-1.11.2.min.js"></script>

    <link rel="stylesheet" type="text/css" href="swx/sweetalert.css">
    <script src="swx/sweetalert-dev.js"></script>
    <!--materialize js-->
    <script type="text/javascript" src="../js/materialize.min.js"></script>
    <script type="text/javascript" src="paper.js"></script>

    <script>
        function sendQues() {
            quesId = $("input[name='group1']:checked").val()
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/tea/pushQues" ,//url
                data: {"quesId":quesId},
                success: function (result) {
                    swal({
                        title: "已发送",
                        text: "",
                        timer: 800,
                        type: "success",
                        showConfirmButton: false
                    });
                    setTimeout(function(){
                        // window.location = "index.html";
                        window.location.href = "index.jsp"
                    },1000)

                },
                error : function() {
                    alert("异常！");
                }
            });
        }
        function getAllQues() {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/tea/getAllQues" ,//url
                data: {},
                success: function (result) {
                    $.each(result.questions,function(j,ques){
                        arr=[]
                        al=['A','B','C','D']

                        for(i=0;i<al.length;i++){
                            xstart=ques.answers.search(al[i])
                            xend=-1
                            if (i+1!=al.length){
                                xend=ques.answers.search(al[i+1])
                            }
                            arr[i]=ques.answers.slice(xstart,xend)
                        }
                        $("#allQues").append("<div class=\"question-card-wapper\">\n" +
                            "        <div class=\"top-wapper\">\n" +
                            "            <div class=\"left-wapper\">\n" +
                            "                <div class=\"questions-type-wapper\" style=\"background-color: rgb(76, 190, 161);\">\n" +
                            "                    <div>\n" +
                            "                        <div class=\"num-word\">\n" +
                            "                                        <span>\n" +
                            "                                            <span>"+(j+1)+"</span>\n" +
                            "                                            <input name=\"group1\" value=\""+ques.questionId+"\" type=\"radio\" id=\"test"+j+"\" />\n" +
                            "    <label for=\"test"+j+"\"></label>" +
                            "                                        </span>\n" +
                            "                        </div>\n" +
                            "                        <div class=\"type-word\"></div>\n" +
                            "                    </div>\n" +
                            "                </div>\n" +
                            "\n" +
                            "                <div class=\"correct-rate-wapper\"></div>\n" +
                            "            </div>\n" +
                            "            <div class=\"imgWrapper content-wapper\">\n" +
                            "                <div class=\"questions-wapper\">\n" +
                            "                    <div class=\"question-head\">\n" +
                            "                        <p class=\"question-content\">\n" +
                            "                        <p>"+ques.title+"</p>\n" +
                            "                        </p>\n" +
                            "                    </div>\n" +
                            "                    <div class=\"questions-body\">\n" +
                            "                        <div class=\"radio-btn-wapper\">\n" +
                            "                            <div class=\"radio-btn\">\n" +
                            "                                <div></div>\n" +
                            "                            </div>\n" +
                            "                            " +arr[0]+
                            "                        </div>\n" +
                            "                        <div class=\"radio-btn-wapper\">\n" +
                            "                            <div class=\"radio-btn\">\n" +
                            "                                <div></div>\n" +
                            "                            </div>\n" +
                            "                            " +arr[1]+
                            "                        </div>\n" +
                            "                        <div class=\"radio-btn-wapper\">\n" +
                            "                            <div class=\"checked-radio-btn\">\n" +
                            "                                <div></div>\n" +
                            "                            </div>\n" +
                            "                            \n" +arr[2]+
                            "                        </div>\n" +
                            "                        <div class=\"radio-btn-wapper\">\n" +
                            "                            <div class=\"radio-btn\">\n" +
                            "                                <div></div>\n" +
                            "                            </div>\n" +
                            "                            " +arr[3]+
                            "                        </div>\n" +
                            "                    </div>\n" +
                            "                </div>\n" +
                            "            </div>\n" +
                            "        </div>\n" +
                            "    </div>")
                    })
                },
                error : function() {
                    alert("异常！");
                }
            });
        }
    </script>

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

</body>

</html>